; ModuleID = 'easy.ll'
source_filename = "easy.c"
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
  %rem = urem i64 %call2, 7, !dbg !29
  tail call void @__coverage__(i32 10, i32 25), !dbg !30
  %cmp = icmp eq i64 %rem, 0, !dbg !30
  tail call void @__coverage__(i32 10, i32 7), !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  tail call void @__coverage__(i32 11, i32 9), !dbg !32
  %1 = load i32, i32* %y, align 4, !dbg !32
  tail call void @__coverage__(i32 11, i32 13), !dbg !34
  %2 = load i32, i32* %x, align 4, !dbg !34
  tail call void @__coverage__(i32 11, i32 11), !dbg !35
  tail call void @__sanitize__(i32 %2, i32 11, i32 11), !dbg !35
  %div = sdiv i32 %1, %2, !dbg !35
  tail call void @__coverage__(i32 11, i32 7), !dbg !36
  store i32 %div, i32* %z, align 4, !dbg !36
  tail call void @__coverage__(i32 12, i32 3), !dbg !37
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  tail call void @__coverage__(i32 14, i32 14), !dbg !38
  %arraydecay3 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !38
  tail call void @__coverage__(i32 14, i32 7), !dbg !40
  %call4 = call i64 @strlen(i8* %arraydecay3) #4, !dbg !40
  tail call void @__coverage__(i32 14, i32 21), !dbg !41
  %rem5 = urem i64 %call4, 13, !dbg !41
  tail call void @__coverage__(i32 14, i32 26), !dbg !42
  %cmp6 = icmp eq i64 %rem5, 0, !dbg !42
  tail call void @__coverage__(i32 14, i32 7), !dbg !43
  br i1 %cmp6, label %if.then7, label %if.end9, !dbg !43

if.then7:                                         ; preds = %if.end
  tail call void @__coverage__(i32 15, i32 9), !dbg !44
  %3 = load i32, i32* %y, align 4, !dbg !44
  tail call void @__coverage__(i32 15, i32 13), !dbg !46
  %4 = load i32, i32* %x, align 4, !dbg !46
  tail call void @__coverage__(i32 15, i32 13), !dbg !46
  %inc = add nsw i32 %4, 1, !dbg !46
  tail call void @__coverage__(i32 15, i32 13), !dbg !46
  store i32 %inc, i32* %x, align 4, !dbg !46
  tail call void @__coverage__(i32 15, i32 11), !dbg !47
  tail call void @__sanitize__(i32 %inc, i32 15, i32 11), !dbg !47
  %div8 = sdiv i32 %3, %inc, !dbg !47
  tail call void @__coverage__(i32 15, i32 7), !dbg !48
  store i32 %div8, i32* %z, align 4, !dbg !48
  tail call void @__coverage__(i32 16, i32 3), !dbg !49
  br label %if.end9, !dbg !49

if.end9:                                          ; preds = %if.then7, %if.end
  tail call void @__coverage__(i32 18, i32 3), !dbg !50
  ret i32 0, !dbg !50
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
!1 = !DIFile(filename: "easy.c", directory: "/home/arun/TakeDownHSS/ASS2/FuzzerPlayground/LLVMBasedFuzzer/Fuzzer/test")
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
!30 = !DILocation(line: 10, column: 25, scope: !27)
!31 = !DILocation(line: 10, column: 7, scope: !7)
!32 = !DILocation(line: 11, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 10, column: 31)
!34 = !DILocation(line: 11, column: 13, scope: !33)
!35 = !DILocation(line: 11, column: 11, scope: !33)
!36 = !DILocation(line: 11, column: 7, scope: !33)
!37 = !DILocation(line: 12, column: 3, scope: !33)
!38 = !DILocation(line: 14, column: 14, scope: !39)
!39 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 7)
!40 = !DILocation(line: 14, column: 7, scope: !39)
!41 = !DILocation(line: 14, column: 21, scope: !39)
!42 = !DILocation(line: 14, column: 26, scope: !39)
!43 = !DILocation(line: 14, column: 7, scope: !7)
!44 = !DILocation(line: 15, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !1, line: 14, column: 32)
!46 = !DILocation(line: 15, column: 13, scope: !45)
!47 = !DILocation(line: 15, column: 11, scope: !45)
!48 = !DILocation(line: 15, column: 7, scope: !45)
!49 = !DILocation(line: 16, column: 3, scope: !45)
!50 = !DILocation(line: 18, column: 3, scope: !7)
