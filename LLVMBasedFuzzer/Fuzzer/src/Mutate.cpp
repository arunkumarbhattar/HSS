/*
* NOTE: You should feel free to manipulate any content in this .cpp file
*/

#include <cstdlib>
#include <iostream>
#include <sys/stat.h>
#include <fstream>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <time.h>

#include <cstring>
#include <cstdio>

#include "Mutate.h"
#include "Utils.h"
#include <cassert>

std::vector<std::string> SeedInputs;
long MostRecentCovSize = 0;
long MostRecentRunIndex = 0;
long CurrCovFileSize = 0;

enum MutationType{
    ReplaceBytesWithRandom = 0,
    SwapAdjacentBytes,
    CycleThroughAllValues,
    InsertARandomByte,
    RemoveARandomByte
};

static const MutationType All[] = {ReplaceBytesWithRandom, SwapAdjacentBytes,
                                   CycleThroughAllValues, RemoveARandomByte,InsertARandomByte };
MutationType CurrMutationType;

//MAP 1
std::map<MutationType, long> MutationTypeToCovLinesSoFar;
//MAP 2
std::map<MutationType, long> MutationTypeToCallCountSoFar;
// MAP 3
std::map<MutationType, double> MutationTypeToPriority;

char* StrMutateAddARandomByte(char* IpStr)
{
    long IpStrLen = strlen(IpStr);

    if (IpStrLen>345)
    {
        //I dont want an input explosion. Hence, as the string size keeps increasing, I slow down the rate
        // of growth of string (dont worry, if something interesting pops up, I scale that technique alpha)
        MutationTypeToPriority[RemoveARandomByte] = 1.01*MutationTypeToPriority[InsertARandomByte] ;
    }

    /*
     * All what I do to add 1 byte to a string and properly Null Terminate it
     */
    char* MutatedStr = (char*)malloc((IpStrLen+2)*sizeof(char));
    strncpy(MutatedStr, IpStr, IpStrLen);
    char* RandomChar = (char*)malloc(sizeof(char));
    *RandomChar =  65 + ( std::rand() % ( 90 - 65 + 1 ) ); //*RandomChar =  33 + ( std::rand() % ( 126 - 33 + 1 ) );
    while((*RandomChar == '\0' || *RandomChar == '\n' || *RandomChar == '\t'))
        *RandomChar =  65 + ( std::rand() % ( 90 - 65 + 1 ) ); //*RandomChar =  33 + ( std::rand() % ( 126 - 33 + 1 ) );
    MutatedStr[IpStrLen] = *RandomChar;
    MutatedStr[IpStrLen+1] = '\0';
    return MutatedStr;
}

char* StrMutateReplaceBytesWithRandom(char* IpByteArray, long SizeOfIpByteArray)
{
    if (SizeOfIpByteArray < 4)
    {   /*
            The IpByteArray String is too small to perform any respectable byte replacement, lets shoot its length up!!
        */
        MutationTypeToPriority[InsertARandomByte] = 1.1*MutationTypeToPriority[InsertARandomByte];
        return StrMutateAddARandomByte(IpByteArray);
    }
    // Below logic generates a "random" number of "random" indexes (within the length of string) to be
    // replaced with random bytes.

    long RandArraySz = (rand()%(SizeOfIpByteArray-2));
    int randArray[RandArraySz];
    for(long i=0;i<RandArraySz;i++)
    {
        randArray[i]= (rand()%(SizeOfIpByteArray-2));
    }
    long NoOfBytesToReplace = RandArraySz;
    /*
     * Generate a copy string to manipulate (directly manipulating IpByteArray causes problems lot of variable problems
     * , especially with the way the C++ destructor deals with freeing.
     */
    char* MutatedStr = (char*)malloc((SizeOfIpByteArray)*sizeof(char));
    strncpy(MutatedStr, IpByteArray, SizeOfIpByteArray);
    for(long ByteIndex = 0 ; ByteIndex < NoOfBytesToReplace; ByteIndex++)
    {
        long i = randArray[ByteIndex];
        char* RandomChar = (char*)malloc(sizeof(char));
        while((*RandomChar == '\0' || *RandomChar == '\n' || *RandomChar == '\t'))
            *RandomChar =  65 + ( std::rand() % ( 90 - 65 + 1 ) ); //*RandomChar =  33 + ( std::rand() % ( 126 - 33 + 1 ) );
        if ((MutatedStr[i] != '\0' && MutatedStr[i] != '\n' && MutatedStr[i] != '\t'))
            MutatedStr[i] = *RandomChar;
    }
    return MutatedStr;
}

char* StrMutateSwapAdjacentBytes(char* IpStr, long IpLen)
{
    /*
     * Swap adjacent bytes, nothing fancy.
     */
    if (IpLen <= 3)
    {
        MutationTypeToPriority[InsertARandomByte] = 1.1*MutationTypeToPriority[RemoveARandomByte];
        return StrMutateAddARandomByte(IpStr);
    }
    long RandomIndex = 0;
    if (IpStr[IpLen-1] == '\0' || IpStr[IpLen-1] == '\n' || IpStr[IpLen-1] == '\t')
        RandomIndex = rand() % (IpLen-3);
    else
        RandomIndex = rand() % (IpLen-2);
    char temp = IpStr[RandomIndex];
    IpStr[RandomIndex] = IpStr[RandomIndex+1];
    IpStr[RandomIndex+1] = temp;
    return IpStr;
}

char* StrMutateCycleAllBytesByOneStep(char* IpStr, long IpLen)
{
    /*
     * Cycle through all bytes just by one step
     */
    long IpStrLen = IpLen;
    if (IpStr[IpStrLen-1] == '\0' || IpStr[IpStrLen-1] == '\n' || IpStr[IpStrLen-1] == '\t')
        IpStrLen = IpStrLen -1;
    for (long i = 0 ; i < IpStrLen; i++)
    {   char val = 1;
        if (IpStr[i] + val != '\0')
            IpStr[i] = IpStr[i] + val;
    }
    return IpStr;
}

char* StrMutateRemoveARandomByte(char* IpStr)
{
    long IpStrLen = strlen(IpStr);
    if (IpStrLen<=3)
    {
        MutationTypeToPriority[InsertARandomByte] = 1.1*MutationTypeToPriority[RemoveARandomByte];
        return StrMutateAddARandomByte(IpStr);
    }
    long RandomIndex = 0;
    if ((IpStr[IpStrLen-1] == '\0' || IpStr[IpStrLen-1] == '\n' || IpStr[IpStrLen-1] == '\t'))
    {
        RandomIndex = rand() % (IpStrLen-3);
    }
    else
        RandomIndex = rand() % (IpStrLen-2);
    memmove(&IpStr[RandomIndex], &IpStr[RandomIndex+1], IpStrLen - RandomIndex - 1);
    IpStr[IpStrLen-1] = '\0';
    return IpStr;
}


std::string MutationTypeEnumToStr(MutationType T)
{
    switch(T)
    {
        case MutationType::ReplaceBytesWithRandom:
            return "ReplaceBytesWithRandom";
        case MutationType::SwapAdjacentBytes:
            return "SwapAdjacentBytes";
        case MutationType::RemoveARandomByte:
            return "RemoveARandomByte";
        case MutationType::InsertARandomByte:
            return "InsertARandomByte";
        case MutationType::CycleThroughAllValues:
            return "CycleThroughAllValues";
    }
    return "";
}

MutationType ReturnBestMutationTechnique(std::string Origin)
{
    /*
     * Return the best Mutation Technique at the moment
     */
    if (MostRecentRunIndex == 0)
    {
        /* Patient Zero*/
        return MutationType::SwapAdjacentBytes;
    }

    MutationType BestMutationTechnique = (MutationType)(rand() % 5);
    double MaxCovGrowth = 0;
    for ( const auto e : All )
    {
        if (MutationTypeToCallCountSoFar[e] == 0)
            MutationTypeToCallCountSoFar[e] = 1;
        double CurrentMutationTechniqueCovGrowth = ((double)MutationTypeToCovLinesSoFar[e]/(double)MutationTypeToCallCountSoFar[e]);
        CurrentMutationTechniqueCovGrowth = CurrentMutationTechniqueCovGrowth*MutationTypeToPriority[e];
        if (CurrentMutationTechniqueCovGrowth > MaxCovGrowth)
        {
            MaxCovGrowth = CurrentMutationTechniqueCovGrowth;
            BestMutationTechnique = e;
        }
    }
    //std::cout<<"Returning Technique  "<<MutationTypeEnumToStr(BestMutationTechnique) <<std::endl;
    return BestMutationTechnique;
}
/************************************************/
/* 		Implement your select input algorithm 	*/
/************************************************/

std::string selectInput() {
  std::string Seed; 
  
  unsigned long LastElementIndex = 0;
  if (SeedInputs.size() != 0)
  {
      LastElementIndex = SeedInputs.size()-1;
      Seed = SeedInputs[LastElementIndex];
  }
  else
      Seed = rand();

  if (SeedInputs.size() > 0)
    SeedInputs.pop_back();
  return Seed;
}

/*********************************************/
/* 		Implement your mutation algorithms	 */
/*********************************************/
 
const char *alpha = "abcdefghijklmnopqrstuvwxyz\n\0";

/*
*mutate gives a naive implementation of mutations, you should implement your method here
*/
std::string mutate(std::string Origin) {
  if (Origin.length() <= 0) return Origin;
  // Fetch the Best Mutation technique -->
  MutationType MutationTechniqueWeWillCurrentlyUse;
  long Strlen = Origin.size();
    MutationTechniqueWeWillCurrentlyUse = ReturnBestMutationTechnique(Origin);
    switch(MutationTechniqueWeWillCurrentlyUse)
    {
        case MutationType::ReplaceBytesWithRandom:
        {
            CurrMutationType = MutationType::ReplaceBytesWithRandom;
            return StrMutateReplaceBytesWithRandom(const_cast<char*>(Origin.c_str()), Strlen);
        }
        case MutationType::CycleThroughAllValues:
        {
            //std::cout<<"Mutatating "<<Origin<<" with Technique CycleThroughAllValues"<<std::endl;
            CurrMutationType = MutationType::CycleThroughAllValues;
            return StrMutateCycleAllBytesByOneStep(const_cast<char*>(Origin.c_str()), Strlen);
        }
        case MutationType::SwapAdjacentBytes:
        {
            //std::cout<<"Mutatating "<<Origin<<" with Technique SwapAdjacentBytes"<<std::endl;
            CurrMutationType = MutationType::SwapAdjacentBytes;
            StrMutateSwapAdjacentBytes(const_cast<char*>(Origin.c_str()), Strlen);
            return Origin;
        }
        case MutationType::InsertARandomByte:
        {
            //std::cout<<"Mutatating "<<Origin<<" with Technique InsertARandomByte"<<std::endl;
            CurrMutationType = MutationType::InsertARandomByte;
            return StrMutateAddARandomByte(const_cast<char*>(Origin.c_str()));
        }
        case MutationType::RemoveARandomByte:
        {
            //std::cout<<"Mutatating "<<Origin<<" with Technique RemoveARandomByte"<<std::endl;
            CurrMutationType = MutationType::RemoveARandomByte;
            return  StrMutateRemoveARandomByte(const_cast<char*>(Origin.c_str()));
        }
        default:
            assert(false && "Oh Snap!, unknown MutationType Returned");
    }
}

/*********************************************/
/* 		Implement your feedback algorithm	 */
/*********************************************/

void feedBack(std::string &Target, std::string &Mutated) {
    std::fstream CovFile;
    std::string CovFileTotalContentStr;
    CovFile.open(Target, std::ios::in);
    if (CovFile.is_open()){
        std::string CovFileLineStr;
        while(getline(CovFile, CovFileLineStr)){
            CovFileTotalContentStr = CovFileTotalContentStr + CovFileLineStr;
        }
        CovFile.close();
    }
    CurrCovFileSize = strlen(CovFileTotalContentStr.c_str());
    // Run Tracker
    auto CurrentRunIndex = MostRecentRunIndex + 1;

    // How much of a coverity growth has this Mutation Technique resulted in.
    double CurrentRunCovGrowth = CurrCovFileSize - MostRecentCovSize;
    SeedInputs.push_back(Mutated);
    if (CurrMutationType == MutationType::InsertARandomByte)
    {
        // Special treatment for insertion (only cuz of the short time limit of 15-25 mins)
        //std::cout<<"Inserting discovered: "<< CurrentRunCovGrowth <<std::endl;
        MutationTypeToCovLinesSoFar[CurrMutationType] = MutationTypeToCovLinesSoFar[CurrMutationType] + (CurrentRunCovGrowth*800);
    }

    if (CurrentRunCovGrowth > 0)
    {
        /*
         * If you found an interesting output, stay and shuffle the shit out of it, to extract the as many
         * failed test cases as possible.
         */
        MutationTypeToPriority[CycleThroughAllValues] = 1.3*MutationTypeToPriority[CycleThroughAllValues];
        MutationTypeToPriority[SwapAdjacentBytes] = 1.3*MutationTypeToPriority[SwapAdjacentBytes];
        MutationTypeToPriority[ReplaceBytesWithRandom] = 1.3*MutationTypeToPriority[ReplaceBytesWithRandom];
    }
    MutationTypeToCallCountSoFar[CurrMutationType] = MutationTypeToCallCountSoFar[CurrMutationType] + 1;
    // Every 80000 runs, I boost the Insertion by 10% (cuz i dont want no stagnation as limit is 15-25 mins)
    if (CurrentRunIndex %80000 == 0)
        MutationTypeToPriority[InsertARandomByte] = 1.01* MutationTypeToPriority[InsertARandomByte];
        MostRecentRunIndex = CurrentRunIndex;
    MostRecentCovSize = CurrCovFileSize;
}

/*****************************************************************/
//helper functions 

int readSeedInputs(std::string &SeedInputDir) {
  DIR *Directory;
  struct dirent *Ent;
  if ((Directory = opendir(SeedInputDir.c_str())) != NULL) {
    while ((Ent = readdir(Directory)) != NULL) {
      if (!(Ent->d_type == DT_REG))
        continue;
      std::string Path = SeedInputDir + "/" + std::string(Ent->d_name);
      std::string Line = readOneFile(Path);
      SeedInputs.push_back(Line);
    }
    closedir(Directory);
    return 0;
  } else {
    return 1;
  }
}

int Freq = 1000;
int Count = 0;

bool test(std::string &Target, std::string &Input, std::string &OutDir) {
  // Clean up old coverage file before running 
  std::string CoveragePath = Target + ".cov";
  std::remove(CoveragePath.c_str());

  Count++;
  int ReturnCode = runTarget(Target, Input);
  switch (ReturnCode) {
  case 0:
    if (Count % Freq == 0)
      storePassingInput(Input, OutDir);
    return true;
  case 256:
    fprintf(stderr, "%d crashes found\n", failureCount);
    storeCrashingInput(Input, OutDir);
    return false;
  case 127:
    fprintf(stderr, "%s not found\n", Target.c_str());
    exit(1);
  default:
    fprintf(stderr, "Invalid exit code %d\n", ReturnCode);
    exit(1);
  }
}

void storeSeed(std::string &OutDir, int randomSeed) {
  std::string Path = OutDir + "/randomSeed.txt";
  std::fstream File(Path, std::fstream::out | std::ios_base::trunc);
  File << std::to_string(randomSeed);
  File.close();
}

// ./fuzzer [exe file] [seed input dir] [output dir] [frequency] [random seed] 
int main(int argc, char **argv) { 
  if (argc < 4) { 
    printf("usage %s [exe file] [seed input dir] [output dir]\n", argv[0]);
    return 1;
  }

  struct stat Buffer;
  if (stat(argv[1], &Buffer)) {
    fprintf(stderr, "%s not found\n", argv[1]);
    return 1;
  }

  if (stat(argv[2], &Buffer)) {
    fprintf(stderr, "%s not found\n", argv[2]);
    return 1;
  }

  if (stat(argv[3], &Buffer)) {
    fprintf(stderr, "%s not found\n", argv[3]);
    return 1;
  }

  if (argc == 5) {
    Freq = strtol(argv[4], NULL, 10);
  }

  int randomSeed = (int)time(NULL);
  if (argc > 5) {
    randomSeed = strtol(argv[5], NULL, 10);
  }
  srand(randomSeed);

  std::string Target(argv[1]);
  std::string SeedInputDir(argv[2]);
  std::string OutDir(argv[3]);
  
  storeSeed(OutDir, randomSeed);
  
  initialize(OutDir);

  if (readSeedInputs(SeedInputDir)) {
    fprintf(stderr, "Cannot read seed input directory\n");
    return 1;
  }

  for (auto e: All)
  {
      MutationTypeToCovLinesSoFar[e] = 1;
      switch (e)
      {
          /*
           * This is my bias-->
           */
          case MutationType::CycleThroughAllValues:
          case MutationType::SwapAdjacentBytes:
              MutationTypeToPriority[e] = 8;
              break;
          case MutationType::InsertARandomByte:
              MutationTypeToPriority[e] = 2;
              break;
          case MutationType::RemoveARandomByte:
              MutationTypeToPriority[e] = 1;
              break;
          case MutationType::ReplaceBytesWithRandom:
              MutationTypeToPriority[e] = 8;
                break;
      }
  }

  while (true) {
      std::string SC = selectInput();
      auto Mutant = mutate(SC);
      system("clear");
      std::cout <<"Mutated String is "<<Mutant<<"\n";
      std::cout <<"Failure Count is "<<failureCount-1<<"\n";
      std::cout << "Run Count: " <<MostRecentRunIndex<<"\n";
      test(Target, Mutant, OutDir);
      feedBack(Target, Mutant);
  }
  return 0;
}
