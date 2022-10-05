; ModuleID = 'path.c'
source_filename = "path.c"
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
  call void @llvm.dbg.declare(metadata [65536 x i8]* %input, metadata !11, metadata !DIExpression()), !dbg !16
  %arraydecay = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !17
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !18
  %call = call i8* @fgets(i8* %arraydecay, i32 65536, %struct._IO_FILE* %0), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %x, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %x, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %y, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 2, i32* %y, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %z, metadata !24, metadata !DIExpression()), !dbg !25
  %arraydecay1 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !26
  %call2 = call i64 @strlen(i8* %arraydecay1) #4, !dbg !28
  %cmp = icmp ugt i64 %call2, 50, !dbg !29
  br i1 %cmp, label %if.then, label %if.end47, !dbg !30

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !31
  %call4 = call i64 @strlen(i8* %arraydecay3) #4, !dbg !34
  %cmp5 = icmp ugt i64 %call4, 60, !dbg !35
  br i1 %cmp5, label %if.then6, label %if.end46, !dbg !36

if.then6:                                         ; preds = %if.then
  %arraydecay7 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !37
  %call8 = call i64 @strlen(i8* %arraydecay7) #4, !dbg !40
  %cmp9 = icmp ugt i64 %call8, 70, !dbg !41
  br i1 %cmp9, label %if.then10, label %if.end45, !dbg !42

if.then10:                                        ; preds = %if.then6
  %arraydecay11 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !43
  %call12 = call i64 @strlen(i8* %arraydecay11) #4, !dbg !46
  %cmp13 = icmp ugt i64 %call12, 80, !dbg !47
  br i1 %cmp13, label %if.then14, label %if.end44, !dbg !48

if.then14:                                        ; preds = %if.then10
  %arraydecay15 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !49
  %call16 = call i64 @strlen(i8* %arraydecay15) #4, !dbg !52
  %cmp17 = icmp ugt i64 %call16, 90, !dbg !53
  br i1 %cmp17, label %if.then18, label %if.end43, !dbg !54

if.then18:                                        ; preds = %if.then14
  %arraydecay19 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !55
  %call20 = call i64 @strlen(i8* %arraydecay19) #4, !dbg !58
  %cmp21 = icmp ugt i64 %call20, 100, !dbg !59
  br i1 %cmp21, label %if.then22, label %if.end42, !dbg !60

if.then22:                                        ; preds = %if.then18
  %arraydecay23 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !61
  %call24 = call i64 @strlen(i8* %arraydecay23) #4, !dbg !64
  %cmp25 = icmp ugt i64 %call24, 110, !dbg !65
  br i1 %cmp25, label %if.then26, label %if.end41, !dbg !66

if.then26:                                        ; preds = %if.then22
  %arraydecay27 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !67
  %call28 = call i64 @strlen(i8* %arraydecay27) #4, !dbg !70
  %cmp29 = icmp ugt i64 %call28, 120, !dbg !71
  br i1 %cmp29, label %if.then30, label %if.end40, !dbg !72

if.then30:                                        ; preds = %if.then26
  %arraydecay31 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !73
  %call32 = call i64 @strlen(i8* %arraydecay31) #4, !dbg !76
  %cmp33 = icmp ugt i64 %call32, 130, !dbg !77
  br i1 %cmp33, label %if.then34, label %if.end39, !dbg !78

if.then34:                                        ; preds = %if.then30
  %arraydecay35 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !79
  %call36 = call i64 @strlen(i8* %arraydecay35) #4, !dbg !82
  %cmp37 = icmp ugt i64 %call36, 140, !dbg !83
  br i1 %cmp37, label %if.then38, label %if.end, !dbg !84

if.then38:                                        ; preds = %if.then34
  %1 = load i32, i32* %y, align 4, !dbg !85
  %2 = load i32, i32* %x, align 4, !dbg !87
  %div = sdiv i32 %1, %2, !dbg !88
  store i32 %div, i32* %z, align 4, !dbg !89
  br label %if.end, !dbg !90

if.end:                                           ; preds = %if.then38, %if.then34
  br label %if.end39, !dbg !91

if.end39:                                         ; preds = %if.end, %if.then30
  br label %if.end40, !dbg !92

if.end40:                                         ; preds = %if.end39, %if.then26
  br label %if.end41, !dbg !93

if.end41:                                         ; preds = %if.end40, %if.then22
  br label %if.end42, !dbg !94

if.end42:                                         ; preds = %if.end41, %if.then18
  br label %if.end43, !dbg !95

if.end43:                                         ; preds = %if.end42, %if.then14
  br label %if.end44, !dbg !96

if.end44:                                         ; preds = %if.end43, %if.then10
  br label %if.end45, !dbg !97

if.end45:                                         ; preds = %if.end44, %if.then6
  br label %if.end46, !dbg !98

if.end46:                                         ; preds = %if.end45, %if.then
  br label %if.end47, !dbg !99

if.end47:                                         ; preds = %if.end46, %entry
  ret i32 0, !dbg !100
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly willreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "path.c", directory: "/home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/Fuzzer/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "input", scope: !7, file: !1, line: 5, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 524288, elements: !14)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!15}
!15 = !DISubrange(count: 65536)
!16 = !DILocation(line: 5, column: 8, scope: !7)
!17 = !DILocation(line: 6, column: 9, scope: !7)
!18 = !DILocation(line: 6, column: 31, scope: !7)
!19 = !DILocation(line: 6, column: 3, scope: !7)
!20 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 7, type: !10)
!21 = !DILocation(line: 7, column: 7, scope: !7)
!22 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 8, type: !10)
!23 = !DILocation(line: 8, column: 7, scope: !7)
!24 = !DILocalVariable(name: "z", scope: !7, file: !1, line: 9, type: !10)
!25 = !DILocation(line: 9, column: 7, scope: !7)
!26 = !DILocation(line: 10, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 7)
!28 = !DILocation(line: 10, column: 7, scope: !27)
!29 = !DILocation(line: 10, column: 21, scope: !27)
!30 = !DILocation(line: 10, column: 7, scope: !7)
!31 = !DILocation(line: 11, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !1, line: 11, column: 9)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 10, column: 27)
!34 = !DILocation(line: 11, column: 9, scope: !32)
!35 = !DILocation(line: 11, column: 23, scope: !32)
!36 = !DILocation(line: 11, column: 9, scope: !33)
!37 = !DILocation(line: 12, column: 18, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !1, line: 12, column: 11)
!39 = distinct !DILexicalBlock(scope: !32, file: !1, line: 11, column: 29)
!40 = !DILocation(line: 12, column: 11, scope: !38)
!41 = !DILocation(line: 12, column: 25, scope: !38)
!42 = !DILocation(line: 12, column: 11, scope: !39)
!43 = !DILocation(line: 13, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !45, file: !1, line: 13, column: 13)
!45 = distinct !DILexicalBlock(scope: !38, file: !1, line: 12, column: 31)
!46 = !DILocation(line: 13, column: 13, scope: !44)
!47 = !DILocation(line: 13, column: 27, scope: !44)
!48 = !DILocation(line: 13, column: 13, scope: !45)
!49 = !DILocation(line: 14, column: 22, scope: !50)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 14, column: 15)
!51 = distinct !DILexicalBlock(scope: !44, file: !1, line: 13, column: 33)
!52 = !DILocation(line: 14, column: 15, scope: !50)
!53 = !DILocation(line: 14, column: 29, scope: !50)
!54 = !DILocation(line: 14, column: 15, scope: !51)
!55 = !DILocation(line: 15, column: 24, scope: !56)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 15, column: 17)
!57 = distinct !DILexicalBlock(scope: !50, file: !1, line: 14, column: 35)
!58 = !DILocation(line: 15, column: 17, scope: !56)
!59 = !DILocation(line: 15, column: 31, scope: !56)
!60 = !DILocation(line: 15, column: 17, scope: !57)
!61 = !DILocation(line: 16, column: 26, scope: !62)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 16, column: 19)
!63 = distinct !DILexicalBlock(scope: !56, file: !1, line: 15, column: 38)
!64 = !DILocation(line: 16, column: 19, scope: !62)
!65 = !DILocation(line: 16, column: 33, scope: !62)
!66 = !DILocation(line: 16, column: 19, scope: !63)
!67 = !DILocation(line: 17, column: 28, scope: !68)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 17, column: 21)
!69 = distinct !DILexicalBlock(scope: !62, file: !1, line: 16, column: 40)
!70 = !DILocation(line: 17, column: 21, scope: !68)
!71 = !DILocation(line: 17, column: 35, scope: !68)
!72 = !DILocation(line: 17, column: 21, scope: !69)
!73 = !DILocation(line: 18, column: 30, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 18, column: 23)
!75 = distinct !DILexicalBlock(scope: !68, file: !1, line: 17, column: 42)
!76 = !DILocation(line: 18, column: 23, scope: !74)
!77 = !DILocation(line: 18, column: 37, scope: !74)
!78 = !DILocation(line: 18, column: 23, scope: !75)
!79 = !DILocation(line: 19, column: 32, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 19, column: 25)
!81 = distinct !DILexicalBlock(scope: !74, file: !1, line: 18, column: 44)
!82 = !DILocation(line: 19, column: 25, scope: !80)
!83 = !DILocation(line: 19, column: 39, scope: !80)
!84 = !DILocation(line: 19, column: 25, scope: !81)
!85 = !DILocation(line: 20, column: 27, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !1, line: 19, column: 46)
!87 = !DILocation(line: 20, column: 31, scope: !86)
!88 = !DILocation(line: 20, column: 29, scope: !86)
!89 = !DILocation(line: 20, column: 25, scope: !86)
!90 = !DILocation(line: 21, column: 21, scope: !86)
!91 = !DILocation(line: 22, column: 19, scope: !81)
!92 = !DILocation(line: 23, column: 17, scope: !75)
!93 = !DILocation(line: 24, column: 15, scope: !69)
!94 = !DILocation(line: 25, column: 13, scope: !63)
!95 = !DILocation(line: 26, column: 11, scope: !57)
!96 = !DILocation(line: 27, column: 9, scope: !51)
!97 = !DILocation(line: 28, column: 7, scope: !45)
!98 = !DILocation(line: 29, column: 5, scope: !39)
!99 = !DILocation(line: 30, column: 3, scope: !33)
!100 = !DILocation(line: 32, column: 3, scope: !7)
