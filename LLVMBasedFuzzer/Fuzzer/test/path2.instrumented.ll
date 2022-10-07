; ModuleID = 'path2.ll'
source_filename = "path2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %input = alloca [65536 x i8], align 16
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  tail call void @__coverage__(i32 5, i32 8), !dbg !11
  call void @llvm.dbg.declare(metadata [65536 x i8]* %input, metadata !12, metadata !DIExpression()), !dbg !11
  tail call void @__coverage__(i32 6, i32 9), !dbg !17
  %arraydecay = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !17
  tail call void @__coverage__(i32 6, i32 31), !dbg !18
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !18
  tail call void @__coverage__(i32 6, i32 3), !dbg !19
  %call = call i8* @fgets(i8* %arraydecay, i32 65536, %struct._IO_FILE* %0), !dbg !19
  tail call void @__coverage__(i32 7, i32 7), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %x, metadata !21, metadata !DIExpression()), !dbg !20
  tail call void @__coverage__(i32 7, i32 7), !dbg !20
  store i32 0, i32* %x, align 4, !dbg !20
  tail call void @__coverage__(i32 8, i32 7), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %y, metadata !23, metadata !DIExpression()), !dbg !22
  tail call void @__coverage__(i32 8, i32 7), !dbg !22
  store i32 2, i32* %y, align 4, !dbg !22
  tail call void @__coverage__(i32 9, i32 7), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %z, metadata !25, metadata !DIExpression()), !dbg !24
  tail call void @__coverage__(i32 10, i32 14), !dbg !26
  %arraydecay1 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !26
  tail call void @__coverage__(i32 10, i32 7), !dbg !28
  %call2 = call i64 @strlen(i8* %arraydecay1) #4, !dbg !28
  tail call void @__coverage__(i32 10, i32 21), !dbg !29
  %cmp = icmp ugt i64 %call2, 50, !dbg !29
  tail call void @__coverage__(i32 10, i32 7), !dbg !30
  br i1 %cmp, label %if.then, label %if.end110, !dbg !30

if.then:                                          ; preds = %entry
  tail call void @__coverage__(i32 11, i32 14), !dbg !31
  %arraydecay3 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !31
  tail call void @__coverage__(i32 11, i32 7), !dbg !34
  %call4 = call i64 @strlen(i8* %arraydecay3) #4, !dbg !34
  tail call void @__coverage__(i32 11, i32 21), !dbg !35
  %cmp5 = icmp ugt i64 %call4, 60, !dbg !35
  tail call void @__coverage__(i32 11, i32 7), !dbg !36
  br i1 %cmp5, label %if.then6, label %if.end109, !dbg !36

if.then6:                                         ; preds = %if.then
  tail call void @__coverage__(i32 12, i32 14), !dbg !37
  %arraydecay7 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !37
  tail call void @__coverage__(i32 12, i32 7), !dbg !40
  %call8 = call i64 @strlen(i8* %arraydecay7) #4, !dbg !40
  tail call void @__coverage__(i32 12, i32 21), !dbg !41
  %cmp9 = icmp ugt i64 %call8, 70, !dbg !41
  tail call void @__coverage__(i32 12, i32 7), !dbg !42
  br i1 %cmp9, label %if.then10, label %if.end108, !dbg !42

if.then10:                                        ; preds = %if.then6
  tail call void @__coverage__(i32 13, i32 14), !dbg !43
  %arraydecay11 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !43
  tail call void @__coverage__(i32 13, i32 7), !dbg !46
  %call12 = call i64 @strlen(i8* %arraydecay11) #4, !dbg !46
  tail call void @__coverage__(i32 13, i32 21), !dbg !47
  %cmp13 = icmp ugt i64 %call12, 80, !dbg !47
  tail call void @__coverage__(i32 13, i32 7), !dbg !48
  br i1 %cmp13, label %if.then14, label %if.end107, !dbg !48

if.then14:                                        ; preds = %if.then10
  tail call void @__coverage__(i32 14, i32 14), !dbg !49
  %arraydecay15 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !49
  tail call void @__coverage__(i32 14, i32 7), !dbg !52
  %call16 = call i64 @strlen(i8* %arraydecay15) #4, !dbg !52
  tail call void @__coverage__(i32 14, i32 21), !dbg !53
  %cmp17 = icmp ugt i64 %call16, 90, !dbg !53
  tail call void @__coverage__(i32 14, i32 7), !dbg !54
  br i1 %cmp17, label %if.then18, label %if.end106, !dbg !54

if.then18:                                        ; preds = %if.then14
  tail call void @__coverage__(i32 15, i32 14), !dbg !55
  %arraydecay19 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !55
  tail call void @__coverage__(i32 15, i32 7), !dbg !58
  %call20 = call i64 @strlen(i8* %arraydecay19) #4, !dbg !58
  tail call void @__coverage__(i32 15, i32 21), !dbg !59
  %cmp21 = icmp ugt i64 %call20, 100, !dbg !59
  tail call void @__coverage__(i32 15, i32 7), !dbg !60
  br i1 %cmp21, label %if.then22, label %if.end105, !dbg !60

if.then22:                                        ; preds = %if.then18
  tail call void @__coverage__(i32 16, i32 14), !dbg !61
  %arraydecay23 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !61
  tail call void @__coverage__(i32 16, i32 7), !dbg !64
  %call24 = call i64 @strlen(i8* %arraydecay23) #4, !dbg !64
  tail call void @__coverage__(i32 16, i32 21), !dbg !65
  %cmp25 = icmp ugt i64 %call24, 110, !dbg !65
  tail call void @__coverage__(i32 16, i32 7), !dbg !66
  br i1 %cmp25, label %if.then26, label %if.end104, !dbg !66

if.then26:                                        ; preds = %if.then22
  tail call void @__coverage__(i32 17, i32 14), !dbg !67
  %arraydecay27 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !67
  tail call void @__coverage__(i32 17, i32 7), !dbg !70
  %call28 = call i64 @strlen(i8* %arraydecay27) #4, !dbg !70
  tail call void @__coverage__(i32 17, i32 21), !dbg !71
  %cmp29 = icmp ugt i64 %call28, 120, !dbg !71
  tail call void @__coverage__(i32 17, i32 7), !dbg !72
  br i1 %cmp29, label %if.then30, label %if.end103, !dbg !72

if.then30:                                        ; preds = %if.then26
  tail call void @__coverage__(i32 18, i32 14), !dbg !73
  %arraydecay31 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !73
  tail call void @__coverage__(i32 18, i32 7), !dbg !76
  %call32 = call i64 @strlen(i8* %arraydecay31) #4, !dbg !76
  tail call void @__coverage__(i32 18, i32 21), !dbg !77
  %cmp33 = icmp ugt i64 %call32, 130, !dbg !77
  tail call void @__coverage__(i32 18, i32 7), !dbg !78
  br i1 %cmp33, label %if.then34, label %if.end102, !dbg !78

if.then34:                                        ; preds = %if.then30
  tail call void @__coverage__(i32 19, i32 14), !dbg !79
  %arraydecay35 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !79
  tail call void @__coverage__(i32 19, i32 7), !dbg !82
  %call36 = call i64 @strlen(i8* %arraydecay35) #4, !dbg !82
  tail call void @__coverage__(i32 19, i32 21), !dbg !83
  %cmp37 = icmp ugt i64 %call36, 140, !dbg !83
  tail call void @__coverage__(i32 19, i32 7), !dbg !84
  br i1 %cmp37, label %if.then38, label %if.end101, !dbg !84

if.then38:                                        ; preds = %if.then34
  tail call void @__coverage__(i32 20, i32 14), !dbg !85
  %arraydecay39 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !85
  tail call void @__coverage__(i32 20, i32 7), !dbg !88
  %call40 = call i64 @strlen(i8* %arraydecay39) #4, !dbg !88
  tail call void @__coverage__(i32 20, i32 21), !dbg !89
  %cmp41 = icmp ugt i64 %call40, 150, !dbg !89
  tail call void @__coverage__(i32 20, i32 7), !dbg !90
  br i1 %cmp41, label %if.then42, label %if.end100, !dbg !90

if.then42:                                        ; preds = %if.then38
  tail call void @__coverage__(i32 21, i32 14), !dbg !91
  %arraydecay43 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !91
  tail call void @__coverage__(i32 21, i32 7), !dbg !94
  %call44 = call i64 @strlen(i8* %arraydecay43) #4, !dbg !94
  tail call void @__coverage__(i32 21, i32 21), !dbg !95
  %cmp45 = icmp ugt i64 %call44, 160, !dbg !95
  tail call void @__coverage__(i32 21, i32 7), !dbg !96
  br i1 %cmp45, label %if.then46, label %if.end99, !dbg !96

if.then46:                                        ; preds = %if.then42
  tail call void @__coverage__(i32 22, i32 14), !dbg !97
  %arraydecay47 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !97
  tail call void @__coverage__(i32 22, i32 7), !dbg !100
  %call48 = call i64 @strlen(i8* %arraydecay47) #4, !dbg !100
  tail call void @__coverage__(i32 22, i32 21), !dbg !101
  %cmp49 = icmp ugt i64 %call48, 170, !dbg !101
  tail call void @__coverage__(i32 22, i32 7), !dbg !102
  br i1 %cmp49, label %if.then50, label %if.end98, !dbg !102

if.then50:                                        ; preds = %if.then46
  tail call void @__coverage__(i32 23, i32 14), !dbg !103
  %arraydecay51 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !103
  tail call void @__coverage__(i32 23, i32 7), !dbg !106
  %call52 = call i64 @strlen(i8* %arraydecay51) #4, !dbg !106
  tail call void @__coverage__(i32 23, i32 21), !dbg !107
  %cmp53 = icmp ugt i64 %call52, 180, !dbg !107
  tail call void @__coverage__(i32 23, i32 7), !dbg !108
  br i1 %cmp53, label %if.then54, label %if.end97, !dbg !108

if.then54:                                        ; preds = %if.then50
  tail call void @__coverage__(i32 24, i32 14), !dbg !109
  %arraydecay55 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !109
  tail call void @__coverage__(i32 24, i32 7), !dbg !112
  %call56 = call i64 @strlen(i8* %arraydecay55) #4, !dbg !112
  tail call void @__coverage__(i32 24, i32 21), !dbg !113
  %cmp57 = icmp ugt i64 %call56, 190, !dbg !113
  tail call void @__coverage__(i32 24, i32 7), !dbg !114
  br i1 %cmp57, label %if.then58, label %if.end96, !dbg !114

if.then58:                                        ; preds = %if.then54
  tail call void @__coverage__(i32 25, i32 14), !dbg !115
  %arraydecay59 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !115
  tail call void @__coverage__(i32 25, i32 7), !dbg !118
  %call60 = call i64 @strlen(i8* %arraydecay59) #4, !dbg !118
  tail call void @__coverage__(i32 25, i32 21), !dbg !119
  %cmp61 = icmp ugt i64 %call60, 200, !dbg !119
  tail call void @__coverage__(i32 25, i32 7), !dbg !120
  br i1 %cmp61, label %if.then62, label %if.end95, !dbg !120

if.then62:                                        ; preds = %if.then58
  tail call void @__coverage__(i32 26, i32 14), !dbg !121
  %arraydecay63 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !121
  tail call void @__coverage__(i32 26, i32 7), !dbg !124
  %call64 = call i64 @strlen(i8* %arraydecay63) #4, !dbg !124
  tail call void @__coverage__(i32 26, i32 21), !dbg !125
  %cmp65 = icmp ugt i64 %call64, 210, !dbg !125
  tail call void @__coverage__(i32 26, i32 7), !dbg !126
  br i1 %cmp65, label %if.then66, label %if.end94, !dbg !126

if.then66:                                        ; preds = %if.then62
  tail call void @__coverage__(i32 27, i32 14), !dbg !127
  %arraydecay67 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !127
  tail call void @__coverage__(i32 27, i32 7), !dbg !130
  %call68 = call i64 @strlen(i8* %arraydecay67) #4, !dbg !130
  tail call void @__coverage__(i32 27, i32 21), !dbg !131
  %cmp69 = icmp ugt i64 %call68, 220, !dbg !131
  tail call void @__coverage__(i32 27, i32 7), !dbg !132
  br i1 %cmp69, label %if.then70, label %if.end93, !dbg !132

if.then70:                                        ; preds = %if.then66
  tail call void @__coverage__(i32 28, i32 14), !dbg !133
  %arraydecay71 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !133
  tail call void @__coverage__(i32 28, i32 7), !dbg !136
  %call72 = call i64 @strlen(i8* %arraydecay71) #4, !dbg !136
  tail call void @__coverage__(i32 28, i32 21), !dbg !137
  %cmp73 = icmp ugt i64 %call72, 230, !dbg !137
  tail call void @__coverage__(i32 28, i32 7), !dbg !138
  br i1 %cmp73, label %if.then74, label %if.end92, !dbg !138

if.then74:                                        ; preds = %if.then70
  tail call void @__coverage__(i32 29, i32 14), !dbg !139
  %arraydecay75 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !139
  tail call void @__coverage__(i32 29, i32 7), !dbg !142
  %call76 = call i64 @strlen(i8* %arraydecay75) #4, !dbg !142
  tail call void @__coverage__(i32 29, i32 21), !dbg !143
  %cmp77 = icmp ugt i64 %call76, 240, !dbg !143
  tail call void @__coverage__(i32 29, i32 7), !dbg !144
  br i1 %cmp77, label %if.then78, label %if.end91, !dbg !144

if.then78:                                        ; preds = %if.then74
  tail call void @__coverage__(i32 30, i32 9), !dbg !145
  %arrayidx = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 25, !dbg !145
  tail call void @__coverage__(i32 30, i32 9), !dbg !145
  %1 = load i8, i8* %arrayidx, align 1, !dbg !145
  tail call void @__coverage__(i32 30, i32 9), !dbg !145
  %conv = sext i8 %1 to i32, !dbg !145
  tail call void @__coverage__(i32 30, i32 19), !dbg !148
  %cmp79 = icmp eq i32 %conv, 97, !dbg !148
  tail call void @__coverage__(i32 30, i32 26), !dbg !149
  br i1 %cmp79, label %if.then90, label %lor.lhs.false, !dbg !149

lor.lhs.false:                                    ; preds = %if.then78
  tail call void @__coverage__(i32 30, i32 29), !dbg !150
  %arrayidx81 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 25, !dbg !150
  tail call void @__coverage__(i32 30, i32 29), !dbg !150
  %2 = load i8, i8* %arrayidx81, align 1, !dbg !150
  tail call void @__coverage__(i32 30, i32 29), !dbg !150
  %conv82 = sext i8 %2 to i32, !dbg !150
  tail call void @__coverage__(i32 30, i32 39), !dbg !151
  %cmp83 = icmp eq i32 %conv82, 98, !dbg !151
  tail call void @__coverage__(i32 30, i32 46), !dbg !152
  br i1 %cmp83, label %if.then90, label %lor.lhs.false85, !dbg !152

lor.lhs.false85:                                  ; preds = %lor.lhs.false
  tail call void @__coverage__(i32 30, i32 49), !dbg !153
  %arrayidx86 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 25, !dbg !153
  tail call void @__coverage__(i32 30, i32 49), !dbg !153
  %3 = load i8, i8* %arrayidx86, align 1, !dbg !153
  tail call void @__coverage__(i32 30, i32 49), !dbg !153
  %conv87 = sext i8 %3 to i32, !dbg !153
  tail call void @__coverage__(i32 30, i32 59), !dbg !154
  %cmp88 = icmp eq i32 %conv87, 99, !dbg !154
  tail call void @__coverage__(i32 30, i32 9), !dbg !155
  br i1 %cmp88, label %if.then90, label %if.end, !dbg !155

if.then90:                                        ; preds = %lor.lhs.false85, %lor.lhs.false, %if.then78
  tail call void @__coverage__(i32 31, i32 11), !dbg !156
  %4 = load i32, i32* %y, align 4, !dbg !156
  tail call void @__coverage__(i32 31, i32 15), !dbg !158
  %5 = load i32, i32* %x, align 4, !dbg !158
  tail call void @__coverage__(i32 31, i32 13), !dbg !159
  tail call void @__sanitize__(i32 %5, i32 31, i32 13), !dbg !159
  %div = sdiv i32 %4, %5, !dbg !159
  tail call void @__coverage__(i32 31, i32 9), !dbg !160
  store i32 %div, i32* %z, align 4, !dbg !160
  tail call void @__coverage__(i32 32, i32 5), !dbg !161
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then90, %lor.lhs.false85
  tail call void @__coverage__(i32 33, i32 3), !dbg !162
  br label %if.end91, !dbg !162

if.end91:                                         ; preds = %if.end, %if.then74
  tail call void @__coverage__(i32 33, i32 5), !dbg !163
  br label %if.end92, !dbg !163

if.end92:                                         ; preds = %if.end91, %if.then70
  tail call void @__coverage__(i32 33, i32 7), !dbg !164
  br label %if.end93, !dbg !164

if.end93:                                         ; preds = %if.end92, %if.then66
  tail call void @__coverage__(i32 33, i32 9), !dbg !165
  br label %if.end94, !dbg !165

if.end94:                                         ; preds = %if.end93, %if.then62
  tail call void @__coverage__(i32 33, i32 11), !dbg !166
  br label %if.end95, !dbg !166

if.end95:                                         ; preds = %if.end94, %if.then58
  tail call void @__coverage__(i32 33, i32 13), !dbg !167
  br label %if.end96, !dbg !167

if.end96:                                         ; preds = %if.end95, %if.then54
  tail call void @__coverage__(i32 33, i32 15), !dbg !168
  br label %if.end97, !dbg !168

if.end97:                                         ; preds = %if.end96, %if.then50
  tail call void @__coverage__(i32 33, i32 17), !dbg !169
  br label %if.end98, !dbg !169

if.end98:                                         ; preds = %if.end97, %if.then46
  tail call void @__coverage__(i32 33, i32 19), !dbg !170
  br label %if.end99, !dbg !170

if.end99:                                         ; preds = %if.end98, %if.then42
  tail call void @__coverage__(i32 33, i32 21), !dbg !171
  br label %if.end100, !dbg !171

if.end100:                                        ; preds = %if.end99, %if.then38
  tail call void @__coverage__(i32 33, i32 23), !dbg !172
  br label %if.end101, !dbg !172

if.end101:                                        ; preds = %if.end100, %if.then34
  tail call void @__coverage__(i32 33, i32 25), !dbg !173
  br label %if.end102, !dbg !173

if.end102:                                        ; preds = %if.end101, %if.then30
  tail call void @__coverage__(i32 33, i32 27), !dbg !174
  br label %if.end103, !dbg !174

if.end103:                                        ; preds = %if.end102, %if.then26
  tail call void @__coverage__(i32 33, i32 29), !dbg !175
  br label %if.end104, !dbg !175

if.end104:                                        ; preds = %if.end103, %if.then22
  tail call void @__coverage__(i32 33, i32 31), !dbg !176
  br label %if.end105, !dbg !176

if.end105:                                        ; preds = %if.end104, %if.then18
  tail call void @__coverage__(i32 33, i32 33), !dbg !177
  br label %if.end106, !dbg !177

if.end106:                                        ; preds = %if.end105, %if.then14
  tail call void @__coverage__(i32 33, i32 35), !dbg !178
  br label %if.end107, !dbg !178

if.end107:                                        ; preds = %if.end106, %if.then10
  tail call void @__coverage__(i32 33, i32 37), !dbg !179
  br label %if.end108, !dbg !179

if.end108:                                        ; preds = %if.end107, %if.then6
  tail call void @__coverage__(i32 33, i32 39), !dbg !180
  br label %if.end109, !dbg !180

if.end109:                                        ; preds = %if.end108, %if.then
  tail call void @__coverage__(i32 33, i32 41), !dbg !181
  br label %if.end110, !dbg !181

if.end110:                                        ; preds = %if.end109, %entry
  tail call void @__coverage__(i32 34, i32 3), !dbg !182
  ret i32 0, !dbg !182
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare void @__coverage__(i32, i32)

declare void @__sanitize__(i32, i32, i32)

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly willreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "path2.c", directory: "/home/twinturbo/TakeDownHSS/LLVMBasedFuzzer/Fuzzer/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocation(line: 5, column: 8, scope: !7)
!12 = !DILocalVariable(name: "input", scope: !7, file: !1, line: 5, type: !13)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 524288, elements: !15)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{!16}
!16 = !DISubrange(count: 65536)
!17 = !DILocation(line: 6, column: 9, scope: !7)
!18 = !DILocation(line: 6, column: 31, scope: !7)
!19 = !DILocation(line: 6, column: 3, scope: !7)
!20 = !DILocation(line: 7, column: 7, scope: !7)
!21 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 7, type: !10)
!22 = !DILocation(line: 8, column: 7, scope: !7)
!23 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 8, type: !10)
!24 = !DILocation(line: 9, column: 7, scope: !7)
!25 = !DILocalVariable(name: "z", scope: !7, file: !1, line: 9, type: !10)
!26 = !DILocation(line: 10, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 7)
!28 = !DILocation(line: 10, column: 7, scope: !27)
!29 = !DILocation(line: 10, column: 21, scope: !27)
!30 = !DILocation(line: 10, column: 7, scope: !7)
!31 = !DILocation(line: 11, column: 14, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !1, line: 11, column: 7)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 10, column: 27)
!34 = !DILocation(line: 11, column: 7, scope: !32)
!35 = !DILocation(line: 11, column: 21, scope: !32)
!36 = !DILocation(line: 11, column: 7, scope: !33)
!37 = !DILocation(line: 12, column: 14, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !1, line: 12, column: 7)
!39 = distinct !DILexicalBlock(scope: !32, file: !1, line: 11, column: 27)
!40 = !DILocation(line: 12, column: 7, scope: !38)
!41 = !DILocation(line: 12, column: 21, scope: !38)
!42 = !DILocation(line: 12, column: 7, scope: !39)
!43 = !DILocation(line: 13, column: 14, scope: !44)
!44 = distinct !DILexicalBlock(scope: !45, file: !1, line: 13, column: 7)
!45 = distinct !DILexicalBlock(scope: !38, file: !1, line: 12, column: 27)
!46 = !DILocation(line: 13, column: 7, scope: !44)
!47 = !DILocation(line: 13, column: 21, scope: !44)
!48 = !DILocation(line: 13, column: 7, scope: !45)
!49 = !DILocation(line: 14, column: 14, scope: !50)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 14, column: 7)
!51 = distinct !DILexicalBlock(scope: !44, file: !1, line: 13, column: 27)
!52 = !DILocation(line: 14, column: 7, scope: !50)
!53 = !DILocation(line: 14, column: 21, scope: !50)
!54 = !DILocation(line: 14, column: 7, scope: !51)
!55 = !DILocation(line: 15, column: 14, scope: !56)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 15, column: 7)
!57 = distinct !DILexicalBlock(scope: !50, file: !1, line: 14, column: 27)
!58 = !DILocation(line: 15, column: 7, scope: !56)
!59 = !DILocation(line: 15, column: 21, scope: !56)
!60 = !DILocation(line: 15, column: 7, scope: !57)
!61 = !DILocation(line: 16, column: 14, scope: !62)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 16, column: 7)
!63 = distinct !DILexicalBlock(scope: !56, file: !1, line: 15, column: 28)
!64 = !DILocation(line: 16, column: 7, scope: !62)
!65 = !DILocation(line: 16, column: 21, scope: !62)
!66 = !DILocation(line: 16, column: 7, scope: !63)
!67 = !DILocation(line: 17, column: 14, scope: !68)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 17, column: 7)
!69 = distinct !DILexicalBlock(scope: !62, file: !1, line: 16, column: 28)
!70 = !DILocation(line: 17, column: 7, scope: !68)
!71 = !DILocation(line: 17, column: 21, scope: !68)
!72 = !DILocation(line: 17, column: 7, scope: !69)
!73 = !DILocation(line: 18, column: 14, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 18, column: 7)
!75 = distinct !DILexicalBlock(scope: !68, file: !1, line: 17, column: 28)
!76 = !DILocation(line: 18, column: 7, scope: !74)
!77 = !DILocation(line: 18, column: 21, scope: !74)
!78 = !DILocation(line: 18, column: 7, scope: !75)
!79 = !DILocation(line: 19, column: 14, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 19, column: 7)
!81 = distinct !DILexicalBlock(scope: !74, file: !1, line: 18, column: 28)
!82 = !DILocation(line: 19, column: 7, scope: !80)
!83 = !DILocation(line: 19, column: 21, scope: !80)
!84 = !DILocation(line: 19, column: 7, scope: !81)
!85 = !DILocation(line: 20, column: 14, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !1, line: 20, column: 7)
!87 = distinct !DILexicalBlock(scope: !80, file: !1, line: 19, column: 28)
!88 = !DILocation(line: 20, column: 7, scope: !86)
!89 = !DILocation(line: 20, column: 21, scope: !86)
!90 = !DILocation(line: 20, column: 7, scope: !87)
!91 = !DILocation(line: 21, column: 14, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 21, column: 7)
!93 = distinct !DILexicalBlock(scope: !86, file: !1, line: 20, column: 28)
!94 = !DILocation(line: 21, column: 7, scope: !92)
!95 = !DILocation(line: 21, column: 21, scope: !92)
!96 = !DILocation(line: 21, column: 7, scope: !93)
!97 = !DILocation(line: 22, column: 14, scope: !98)
!98 = distinct !DILexicalBlock(scope: !99, file: !1, line: 22, column: 7)
!99 = distinct !DILexicalBlock(scope: !92, file: !1, line: 21, column: 28)
!100 = !DILocation(line: 22, column: 7, scope: !98)
!101 = !DILocation(line: 22, column: 21, scope: !98)
!102 = !DILocation(line: 22, column: 7, scope: !99)
!103 = !DILocation(line: 23, column: 14, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 23, column: 7)
!105 = distinct !DILexicalBlock(scope: !98, file: !1, line: 22, column: 28)
!106 = !DILocation(line: 23, column: 7, scope: !104)
!107 = !DILocation(line: 23, column: 21, scope: !104)
!108 = !DILocation(line: 23, column: 7, scope: !105)
!109 = !DILocation(line: 24, column: 14, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !1, line: 24, column: 7)
!111 = distinct !DILexicalBlock(scope: !104, file: !1, line: 23, column: 28)
!112 = !DILocation(line: 24, column: 7, scope: !110)
!113 = !DILocation(line: 24, column: 21, scope: !110)
!114 = !DILocation(line: 24, column: 7, scope: !111)
!115 = !DILocation(line: 25, column: 14, scope: !116)
!116 = distinct !DILexicalBlock(scope: !117, file: !1, line: 25, column: 7)
!117 = distinct !DILexicalBlock(scope: !110, file: !1, line: 24, column: 28)
!118 = !DILocation(line: 25, column: 7, scope: !116)
!119 = !DILocation(line: 25, column: 21, scope: !116)
!120 = !DILocation(line: 25, column: 7, scope: !117)
!121 = !DILocation(line: 26, column: 14, scope: !122)
!122 = distinct !DILexicalBlock(scope: !123, file: !1, line: 26, column: 7)
!123 = distinct !DILexicalBlock(scope: !116, file: !1, line: 25, column: 28)
!124 = !DILocation(line: 26, column: 7, scope: !122)
!125 = !DILocation(line: 26, column: 21, scope: !122)
!126 = !DILocation(line: 26, column: 7, scope: !123)
!127 = !DILocation(line: 27, column: 14, scope: !128)
!128 = distinct !DILexicalBlock(scope: !129, file: !1, line: 27, column: 7)
!129 = distinct !DILexicalBlock(scope: !122, file: !1, line: 26, column: 28)
!130 = !DILocation(line: 27, column: 7, scope: !128)
!131 = !DILocation(line: 27, column: 21, scope: !128)
!132 = !DILocation(line: 27, column: 7, scope: !129)
!133 = !DILocation(line: 28, column: 14, scope: !134)
!134 = distinct !DILexicalBlock(scope: !135, file: !1, line: 28, column: 7)
!135 = distinct !DILexicalBlock(scope: !128, file: !1, line: 27, column: 28)
!136 = !DILocation(line: 28, column: 7, scope: !134)
!137 = !DILocation(line: 28, column: 21, scope: !134)
!138 = !DILocation(line: 28, column: 7, scope: !135)
!139 = !DILocation(line: 29, column: 14, scope: !140)
!140 = distinct !DILexicalBlock(scope: !141, file: !1, line: 29, column: 7)
!141 = distinct !DILexicalBlock(scope: !134, file: !1, line: 28, column: 28)
!142 = !DILocation(line: 29, column: 7, scope: !140)
!143 = !DILocation(line: 29, column: 21, scope: !140)
!144 = !DILocation(line: 29, column: 7, scope: !141)
!145 = !DILocation(line: 30, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !147, file: !1, line: 30, column: 9)
!147 = distinct !DILexicalBlock(scope: !140, file: !1, line: 29, column: 28)
!148 = !DILocation(line: 30, column: 19, scope: !146)
!149 = !DILocation(line: 30, column: 26, scope: !146)
!150 = !DILocation(line: 30, column: 29, scope: !146)
!151 = !DILocation(line: 30, column: 39, scope: !146)
!152 = !DILocation(line: 30, column: 46, scope: !146)
!153 = !DILocation(line: 30, column: 49, scope: !146)
!154 = !DILocation(line: 30, column: 59, scope: !146)
!155 = !DILocation(line: 30, column: 9, scope: !147)
!156 = !DILocation(line: 31, column: 11, scope: !157)
!157 = distinct !DILexicalBlock(scope: !146, file: !1, line: 30, column: 67)
!158 = !DILocation(line: 31, column: 15, scope: !157)
!159 = !DILocation(line: 31, column: 13, scope: !157)
!160 = !DILocation(line: 31, column: 9, scope: !157)
!161 = !DILocation(line: 32, column: 5, scope: !157)
!162 = !DILocation(line: 33, column: 3, scope: !147)
!163 = !DILocation(line: 33, column: 5, scope: !141)
!164 = !DILocation(line: 33, column: 7, scope: !135)
!165 = !DILocation(line: 33, column: 9, scope: !129)
!166 = !DILocation(line: 33, column: 11, scope: !123)
!167 = !DILocation(line: 33, column: 13, scope: !117)
!168 = !DILocation(line: 33, column: 15, scope: !111)
!169 = !DILocation(line: 33, column: 17, scope: !105)
!170 = !DILocation(line: 33, column: 19, scope: !99)
!171 = !DILocation(line: 33, column: 21, scope: !93)
!172 = !DILocation(line: 33, column: 23, scope: !87)
!173 = !DILocation(line: 33, column: 25, scope: !81)
!174 = !DILocation(line: 33, column: 27, scope: !75)
!175 = !DILocation(line: 33, column: 29, scope: !69)
!176 = !DILocation(line: 33, column: 31, scope: !63)
!177 = !DILocation(line: 33, column: 33, scope: !57)
!178 = !DILocation(line: 33, column: 35, scope: !51)
!179 = !DILocation(line: 33, column: 37, scope: !45)
!180 = !DILocation(line: 33, column: 39, scope: !39)
!181 = !DILocation(line: 33, column: 41, scope: !33)
!182 = !DILocation(line: 34, column: 3, scope: !7)
