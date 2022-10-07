; ModuleID = 'path3.c'
source_filename = "path3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [12 x i8] c"%d, %d, %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %buf0 = alloca [6000 x i8], align 16
  %buf1 = alloca [6000 x i8], align 16
  %buf2 = alloca [6000 x i8], align 16
  %a = alloca i32, align 4
  %r = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.declare(metadata i32* %y, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %z, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata [6000 x i8]* %buf0, metadata !17, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [6000 x i8]* %buf1, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [6000 x i8]* %buf2, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %a, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 0, i32* %a, align 4, !dbg !28
  call void @llvm.dbg.declare(metadata i32* %r, metadata !29, metadata !DIExpression()), !dbg !30
  store i32 43, i32* %r, align 4, !dbg !30
  %arraydecay = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf0, i64 0, i64 0, !dbg !31
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !32
  %call = call i8* @fgets(i8* %arraydecay, i32 6000, %struct._IO_FILE* %0), !dbg !33
  %arraydecay1 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf1, i64 0, i64 0, !dbg !34
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !35
  %call2 = call i8* @fgets(i8* %arraydecay1, i32 6000, %struct._IO_FILE* %1), !dbg !36
  %arraydecay3 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf2, i64 0, i64 0, !dbg !37
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !38
  %call4 = call i8* @fgets(i8* %arraydecay3, i32 6000, %struct._IO_FILE* %2), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %b, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 0, i32* %b, align 4, !dbg !41
  %arraydecay5 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf0, i64 0, i64 0, !dbg !42
  %call6 = call i64 @strlen(i8* %arraydecay5) #4, !dbg !43
  %arraydecay7 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf1, i64 0, i64 0, !dbg !44
  %call8 = call i64 @strlen(i8* %arraydecay7) #4, !dbg !45
  %arraydecay9 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf2, i64 0, i64 0, !dbg !46
  %call10 = call i64 @strlen(i8* %arraydecay9) #4, !dbg !47
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i64 %call6, i64 %call8, i64 %call10), !dbg !48
  %arraydecay12 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf0, i64 0, i64 0, !dbg !49
  %call13 = call i64 @strlen(i8* %arraydecay12) #4, !dbg !51
  %cmp = icmp ult i64 %call13, 100, !dbg !52
  br i1 %cmp, label %if.then, label %if.end68, !dbg !53

if.then:                                          ; preds = %entry
  %arraydecay14 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf0, i64 0, i64 0, !dbg !54
  %call15 = call i64 @strlen(i8* %arraydecay14) #4, !dbg !56
  %cmp16 = icmp ugt i64 %call15, 10, !dbg !57
  br i1 %cmp16, label %if.then17, label %if.end67, !dbg !58

if.then17:                                        ; preds = %if.then
  %arraydecay18 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf0, i64 0, i64 0, !dbg !59
  %call19 = call i64 @strlen(i8* %arraydecay18) #4, !dbg !61
  %cmp20 = icmp ult i64 %call19, 70, !dbg !62
  br i1 %cmp20, label %if.then21, label %if.end66, !dbg !63

if.then21:                                        ; preds = %if.then17
  %arraydecay22 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf0, i64 0, i64 0, !dbg !64
  %call23 = call i64 @strlen(i8* %arraydecay22) #4, !dbg !66
  %cmp24 = icmp ugt i64 %call23, 20, !dbg !67
  br i1 %cmp24, label %if.then25, label %if.end65, !dbg !68

if.then25:                                        ; preds = %if.then21
  %arraydecay26 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf1, i64 0, i64 0, !dbg !69
  %call27 = call i64 @strlen(i8* %arraydecay26) #4, !dbg !71
  %cmp28 = icmp ult i64 %call27, 250, !dbg !72
  br i1 %cmp28, label %if.then29, label %if.end64, !dbg !73

if.then29:                                        ; preds = %if.then25
  %arraydecay30 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf1, i64 0, i64 0, !dbg !74
  %call31 = call i64 @strlen(i8* %arraydecay30) #4, !dbg !76
  %cmp32 = icmp ult i64 %call31, 200, !dbg !77
  br i1 %cmp32, label %if.then33, label %if.end63, !dbg !78

if.then33:                                        ; preds = %if.then29
  %arraydecay34 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf1, i64 0, i64 0, !dbg !79
  %call35 = call i64 @strlen(i8* %arraydecay34) #4, !dbg !81
  %cmp36 = icmp ugt i64 %call35, 20, !dbg !82
  br i1 %cmp36, label %if.then37, label %if.end62, !dbg !83

if.then37:                                        ; preds = %if.then33
  %arraydecay38 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf1, i64 0, i64 0, !dbg !84
  %call39 = call i64 @strlen(i8* %arraydecay38) #4, !dbg !86
  %cmp40 = icmp ugt i64 %call39, 30, !dbg !87
  br i1 %cmp40, label %if.then41, label %if.end61, !dbg !88

if.then41:                                        ; preds = %if.then37
  %arraydecay42 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf2, i64 0, i64 0, !dbg !89
  %call43 = call i64 @strlen(i8* %arraydecay42) #4, !dbg !91
  %cmp44 = icmp ult i64 %call43, 350, !dbg !92
  br i1 %cmp44, label %if.then45, label %if.end60, !dbg !93

if.then45:                                        ; preds = %if.then41
  %arraydecay46 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf2, i64 0, i64 0, !dbg !94
  %call47 = call i64 @strlen(i8* %arraydecay46) #4, !dbg !96
  %cmp48 = icmp ult i64 %call47, 300, !dbg !97
  br i1 %cmp48, label %if.then49, label %if.end59, !dbg !98

if.then49:                                        ; preds = %if.then45
  %arraydecay50 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf2, i64 0, i64 0, !dbg !99
  %call51 = call i64 @strlen(i8* %arraydecay50) #4, !dbg !101
  %cmp52 = icmp ugt i64 %call51, 100, !dbg !102
  br i1 %cmp52, label %if.then53, label %if.end58, !dbg !103

if.then53:                                        ; preds = %if.then49
  %arraydecay54 = getelementptr inbounds [6000 x i8], [6000 x i8]* %buf2, i64 0, i64 0, !dbg !104
  %call55 = call i64 @strlen(i8* %arraydecay54) #4, !dbg !106
  %cmp56 = icmp ugt i64 %call55, 120, !dbg !107
  br i1 %cmp56, label %if.then57, label %if.end, !dbg !108

if.then57:                                        ; preds = %if.then53
  store i32 1, i32* %b, align 4, !dbg !109
  br label %if.end, !dbg !110

if.end:                                           ; preds = %if.then57, %if.then53
  br label %if.end58, !dbg !111

if.end58:                                         ; preds = %if.end, %if.then49
  br label %if.end59, !dbg !112

if.end59:                                         ; preds = %if.end58, %if.then45
  br label %if.end60, !dbg !113

if.end60:                                         ; preds = %if.end59, %if.then41
  br label %if.end61, !dbg !114

if.end61:                                         ; preds = %if.end60, %if.then37
  br label %if.end62, !dbg !115

if.end62:                                         ; preds = %if.end61, %if.then33
  br label %if.end63, !dbg !116

if.end63:                                         ; preds = %if.end62, %if.then29
  br label %if.end64, !dbg !117

if.end64:                                         ; preds = %if.end63, %if.then25
  br label %if.end65, !dbg !118

if.end65:                                         ; preds = %if.end64, %if.then21
  br label %if.end66, !dbg !119

if.end66:                                         ; preds = %if.end65, %if.then17
  br label %if.end67, !dbg !120

if.end67:                                         ; preds = %if.end66, %if.then
  br label %if.end68, !dbg !121

if.end68:                                         ; preds = %if.end67, %entry
  %3 = load i32, i32* %b, align 4, !dbg !122
  %tobool = icmp ne i32 %3, 0, !dbg !122
  br i1 %tobool, label %if.then69, label %if.end71, !dbg !124

if.then69:                                        ; preds = %if.end68
  %4 = load i32, i32* %r, align 4, !dbg !125
  %5 = load i32, i32* %a, align 4, !dbg !126
  %div = sdiv i32 %4, %5, !dbg !127
  %call70 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %div), !dbg !128
  br label %if.end71, !dbg !128

if.end71:                                         ; preds = %if.then69, %if.end68
  ret i32 0, !dbg !129
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

declare dso_local i32 @printf(i8*, ...) #2

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
!1 = !DIFile(filename: "path3.c", directory: "/home/twinturbo/TakeDownHSS/LLVMBasedFuzzer/Fuzzer/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !8, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 5, column: 7, scope: !7)
!13 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocation(line: 5, column: 10, scope: !7)
!15 = !DILocalVariable(name: "z", scope: !7, file: !1, line: 5, type: !10)
!16 = !DILocation(line: 5, column: 13, scope: !7)
!17 = !DILocalVariable(name: "buf0", scope: !7, file: !1, line: 6, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 48000, elements: !20)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{!21}
!21 = !DISubrange(count: 6000)
!22 = !DILocation(line: 6, column: 8, scope: !7)
!23 = !DILocalVariable(name: "buf1", scope: !7, file: !1, line: 6, type: !18)
!24 = !DILocation(line: 6, column: 20, scope: !7)
!25 = !DILocalVariable(name: "buf2", scope: !7, file: !1, line: 6, type: !18)
!26 = !DILocation(line: 6, column: 32, scope: !7)
!27 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 7, type: !10)
!28 = !DILocation(line: 7, column: 7, scope: !7)
!29 = !DILocalVariable(name: "r", scope: !7, file: !1, line: 8, type: !10)
!30 = !DILocation(line: 8, column: 7, scope: !7)
!31 = !DILocation(line: 10, column: 9, scope: !7)
!32 = !DILocation(line: 10, column: 29, scope: !7)
!33 = !DILocation(line: 10, column: 3, scope: !7)
!34 = !DILocation(line: 11, column: 9, scope: !7)
!35 = !DILocation(line: 11, column: 29, scope: !7)
!36 = !DILocation(line: 11, column: 3, scope: !7)
!37 = !DILocation(line: 12, column: 9, scope: !7)
!38 = !DILocation(line: 12, column: 29, scope: !7)
!39 = !DILocation(line: 12, column: 3, scope: !7)
!40 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 14, type: !10)
!41 = !DILocation(line: 14, column: 7, scope: !7)
!42 = !DILocation(line: 16, column: 31, scope: !7)
!43 = !DILocation(line: 16, column: 24, scope: !7)
!44 = !DILocation(line: 16, column: 45, scope: !7)
!45 = !DILocation(line: 16, column: 38, scope: !7)
!46 = !DILocation(line: 16, column: 59, scope: !7)
!47 = !DILocation(line: 16, column: 52, scope: !7)
!48 = !DILocation(line: 16, column: 1, scope: !7)
!49 = !DILocation(line: 18, column: 14, scope: !50)
!50 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 7)
!51 = !DILocation(line: 18, column: 7, scope: !50)
!52 = !DILocation(line: 18, column: 20, scope: !50)
!53 = !DILocation(line: 18, column: 7, scope: !7)
!54 = !DILocation(line: 19, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !1, line: 19, column: 9)
!56 = !DILocation(line: 19, column: 9, scope: !55)
!57 = !DILocation(line: 19, column: 22, scope: !55)
!58 = !DILocation(line: 19, column: 9, scope: !50)
!59 = !DILocation(line: 20, column: 18, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !1, line: 20, column: 11)
!61 = !DILocation(line: 20, column: 11, scope: !60)
!62 = !DILocation(line: 20, column: 24, scope: !60)
!63 = !DILocation(line: 20, column: 11, scope: !55)
!64 = !DILocation(line: 21, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !1, line: 21, column: 13)
!66 = !DILocation(line: 21, column: 13, scope: !65)
!67 = !DILocation(line: 21, column: 26, scope: !65)
!68 = !DILocation(line: 21, column: 13, scope: !60)
!69 = !DILocation(line: 22, column: 22, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !1, line: 22, column: 15)
!71 = !DILocation(line: 22, column: 15, scope: !70)
!72 = !DILocation(line: 22, column: 28, scope: !70)
!73 = !DILocation(line: 22, column: 15, scope: !65)
!74 = !DILocation(line: 23, column: 24, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !1, line: 23, column: 17)
!76 = !DILocation(line: 23, column: 17, scope: !75)
!77 = !DILocation(line: 23, column: 30, scope: !75)
!78 = !DILocation(line: 23, column: 17, scope: !70)
!79 = !DILocation(line: 24, column: 26, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !1, line: 24, column: 19)
!81 = !DILocation(line: 24, column: 19, scope: !80)
!82 = !DILocation(line: 24, column: 32, scope: !80)
!83 = !DILocation(line: 24, column: 19, scope: !75)
!84 = !DILocation(line: 25, column: 28, scope: !85)
!85 = distinct !DILexicalBlock(scope: !80, file: !1, line: 25, column: 21)
!86 = !DILocation(line: 25, column: 21, scope: !85)
!87 = !DILocation(line: 25, column: 34, scope: !85)
!88 = !DILocation(line: 25, column: 21, scope: !80)
!89 = !DILocation(line: 26, column: 30, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !1, line: 26, column: 23)
!91 = !DILocation(line: 26, column: 23, scope: !90)
!92 = !DILocation(line: 26, column: 36, scope: !90)
!93 = !DILocation(line: 26, column: 23, scope: !85)
!94 = !DILocation(line: 27, column: 32, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !1, line: 27, column: 25)
!96 = !DILocation(line: 27, column: 25, scope: !95)
!97 = !DILocation(line: 27, column: 38, scope: !95)
!98 = !DILocation(line: 27, column: 25, scope: !90)
!99 = !DILocation(line: 28, column: 34, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !1, line: 28, column: 27)
!101 = !DILocation(line: 28, column: 27, scope: !100)
!102 = !DILocation(line: 28, column: 40, scope: !100)
!103 = !DILocation(line: 28, column: 27, scope: !95)
!104 = !DILocation(line: 29, column: 36, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !1, line: 29, column: 29)
!106 = !DILocation(line: 29, column: 29, scope: !105)
!107 = !DILocation(line: 29, column: 42, scope: !105)
!108 = !DILocation(line: 29, column: 29, scope: !100)
!109 = !DILocation(line: 30, column: 29, scope: !105)
!110 = !DILocation(line: 30, column: 27, scope: !105)
!111 = !DILocation(line: 29, column: 44, scope: !105)
!112 = !DILocation(line: 28, column: 42, scope: !100)
!113 = !DILocation(line: 27, column: 40, scope: !95)
!114 = !DILocation(line: 26, column: 38, scope: !90)
!115 = !DILocation(line: 25, column: 36, scope: !85)
!116 = !DILocation(line: 24, column: 34, scope: !80)
!117 = !DILocation(line: 23, column: 32, scope: !75)
!118 = !DILocation(line: 22, column: 30, scope: !70)
!119 = !DILocation(line: 21, column: 28, scope: !65)
!120 = !DILocation(line: 20, column: 26, scope: !60)
!121 = !DILocation(line: 19, column: 24, scope: !55)
!122 = !DILocation(line: 31, column: 7, scope: !123)
!123 = distinct !DILexicalBlock(scope: !7, file: !1, line: 31, column: 7)
!124 = !DILocation(line: 31, column: 7, scope: !7)
!125 = !DILocation(line: 32, column: 20, scope: !123)
!126 = !DILocation(line: 32, column: 22, scope: !123)
!127 = !DILocation(line: 32, column: 21, scope: !123)
!128 = !DILocation(line: 32, column: 5, scope: !123)
!129 = !DILocation(line: 33, column: 3, scope: !7)
