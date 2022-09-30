; ModuleID = 'sanity.c'
source_filename = "sanity.c"
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
  %1 = load i32, i32* %y, align 4, !dbg !26
  %2 = load i32, i32* %x, align 4, !dbg !27
  %div = sdiv i32 %1, %2, !dbg !28
  store i32 %div, i32* %z, align 4, !dbg !25
  ret i32 0, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "sanity.c", directory: "/home/arun/TakeDownHSS/ASS2/FuzzerPlayground/LLVMBasedFuzzer/Fuzzer/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "input", scope: !7, file: !1, line: 4, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 524288, elements: !14)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!15}
!15 = !DISubrange(count: 65536)
!16 = !DILocation(line: 4, column: 8, scope: !7)
!17 = !DILocation(line: 5, column: 9, scope: !7)
!18 = !DILocation(line: 5, column: 31, scope: !7)
!19 = !DILocation(line: 5, column: 3, scope: !7)
!20 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 6, type: !10)
!21 = !DILocation(line: 6, column: 7, scope: !7)
!22 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 7, type: !10)
!23 = !DILocation(line: 7, column: 7, scope: !7)
!24 = !DILocalVariable(name: "z", scope: !7, file: !1, line: 8, type: !10)
!25 = !DILocation(line: 8, column: 7, scope: !7)
!26 = !DILocation(line: 8, column: 11, scope: !7)
!27 = !DILocation(line: 8, column: 15, scope: !7)
!28 = !DILocation(line: 8, column: 13, scope: !7)
!29 = !DILocation(line: 9, column: 3, scope: !7)
