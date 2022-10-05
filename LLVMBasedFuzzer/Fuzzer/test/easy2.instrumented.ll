; ModuleID = 'easy2.ll'
source_filename = "easy2.c"
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
  store i32 13, i32* %x, align 4, !dbg !20
  tail call void @__coverage__(i32 8, i32 7), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %z, metadata !23, metadata !DIExpression()), !dbg !22
  tail call void @__coverage__(i32 8, i32 7), !dbg !22
  store i32 21, i32* %z, align 4, !dbg !22
  tail call void @__coverage__(i32 10, i32 14), !dbg !24
  %arraydecay1 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !24
  tail call void @__coverage__(i32 10, i32 7), !dbg !26
  %call2 = call i64 @strlen(i8* %arraydecay1) #4, !dbg !26
  tail call void @__coverage__(i32 10, i32 21), !dbg !27
  %rem = urem i64 %call2, 13, !dbg !27
  tail call void @__coverage__(i32 10, i32 26), !dbg !28
  %cmp = icmp eq i64 %rem, 0, !dbg !28
  tail call void @__coverage__(i32 10, i32 7), !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  tail call void @__coverage__(i32 11, i32 9), !dbg !30
  %1 = load i32, i32* %x, align 4, !dbg !30
  tail call void @__coverage__(i32 11, i32 11), !dbg !32
  tail call void @__sanitize__(i32 0, i32 11, i32 11), !dbg !32
  %div = sdiv i32 %1, 0, !dbg !32
  tail call void @__coverage__(i32 11, i32 7), !dbg !33
  store i32 %div, i32* %z, align 4, !dbg !33
  tail call void @__coverage__(i32 12, i32 3), !dbg !34
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  tail call void @__coverage__(i32 14, i32 14), !dbg !35
  %arraydecay3 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 0, !dbg !35
  tail call void @__coverage__(i32 14, i32 7), !dbg !37
  %call4 = call i64 @strlen(i8* %arraydecay3) #4, !dbg !37
  tail call void @__coverage__(i32 14, i32 21), !dbg !38
  %cmp5 = icmp ugt i64 %call4, 100, !dbg !38
  tail call void @__coverage__(i32 14, i32 27), !dbg !39
  br i1 %cmp5, label %land.lhs.true, label %if.end10, !dbg !39

land.lhs.true:                                    ; preds = %if.end
  tail call void @__coverage__(i32 14, i32 30), !dbg !40
  %arrayidx = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i64 0, i64 25, !dbg !40
  tail call void @__coverage__(i32 14, i32 30), !dbg !40
  %2 = load i8, i8* %arrayidx, align 1, !dbg !40
  tail call void @__coverage__(i32 14, i32 30), !dbg !40
  %conv = sext i8 %2 to i32, !dbg !40
  tail call void @__coverage__(i32 14, i32 40), !dbg !41
  %cmp6 = icmp eq i32 %conv, 97, !dbg !41
  tail call void @__coverage__(i32 14, i32 7), !dbg !42
  br i1 %cmp6, label %if.then8, label %if.end10, !dbg !42

if.then8:                                         ; preds = %land.lhs.true
  tail call void @__coverage__(i32 15, i32 9), !dbg !43
  %3 = load i32, i32* %x, align 4, !dbg !43
  tail call void @__coverage__(i32 15, i32 11), !dbg !45
  tail call void @__sanitize__(i32 0, i32 15, i32 11), !dbg !45
  %div9 = sdiv i32 %3, 0, !dbg !45
  tail call void @__coverage__(i32 15, i32 7), !dbg !46
  store i32 %div9, i32* %z, align 4, !dbg !46
  tail call void @__coverage__(i32 16, i32 3), !dbg !47
  br label %if.end10, !dbg !47

if.end10:                                         ; preds = %if.then8, %land.lhs.true, %if.end
  tail call void @__coverage__(i32 18, i32 3), !dbg !48
  ret i32 0, !dbg !48
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
!1 = !DIFile(filename: "easy2.c", directory: "/home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/Fuzzer/test")
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
!23 = !DILocalVariable(name: "z", scope: !7, file: !1, line: 8, type: !10)
!24 = !DILocation(line: 10, column: 14, scope: !25)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 7)
!26 = !DILocation(line: 10, column: 7, scope: !25)
!27 = !DILocation(line: 10, column: 21, scope: !25)
!28 = !DILocation(line: 10, column: 26, scope: !25)
!29 = !DILocation(line: 10, column: 7, scope: !7)
!30 = !DILocation(line: 11, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !25, file: !1, line: 10, column: 32)
!32 = !DILocation(line: 11, column: 11, scope: !31)
!33 = !DILocation(line: 11, column: 7, scope: !31)
!34 = !DILocation(line: 12, column: 3, scope: !31)
!35 = !DILocation(line: 14, column: 14, scope: !36)
!36 = distinct !DILexicalBlock(scope: !7, file: !1, line: 14, column: 7)
!37 = !DILocation(line: 14, column: 7, scope: !36)
!38 = !DILocation(line: 14, column: 21, scope: !36)
!39 = !DILocation(line: 14, column: 27, scope: !36)
!40 = !DILocation(line: 14, column: 30, scope: !36)
!41 = !DILocation(line: 14, column: 40, scope: !36)
!42 = !DILocation(line: 14, column: 7, scope: !7)
!43 = !DILocation(line: 15, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !36, file: !1, line: 14, column: 48)
!45 = !DILocation(line: 15, column: 11, scope: !44)
!46 = !DILocation(line: 15, column: 7, scope: !44)
!47 = !DILocation(line: 16, column: 3, scope: !44)
!48 = !DILocation(line: 18, column: 3, scope: !7)
