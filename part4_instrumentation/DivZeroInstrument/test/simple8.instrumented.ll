; ModuleID = 'simple8.ll'
source_filename = "simple8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  tail call void @__coverage__(i32 4, i32 7), !dbg !11
  call void @llvm.dbg.declare(metadata i32* %x, metadata !12, metadata !DIExpression()), !dbg !11
  tail call void @__coverage__(i32 4, i32 15), !dbg !13
  %call = call i32 @getchar(), !dbg !13
  tail call void @__coverage__(i32 4, i32 13), !dbg !14
  %mul = mul nsw i32 2, %call, !dbg !14
  tail call void @__coverage__(i32 4, i32 25), !dbg !15
  %sub = sub nsw i32 %mul, 180, !dbg !15
  tail call void @__coverage__(i32 4, i32 7), !dbg !11
  store i32 %sub, i32* %x, align 4, !dbg !11
  tail call void @__coverage__(i32 5, i32 7), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %y, metadata !17, metadata !DIExpression()), !dbg !16
  tail call void @__coverage__(i32 5, i32 15), !dbg !18
  %0 = load i32, i32* %x, align 4, !dbg !18
  tail call void @__coverage__(i32 5, i32 13), !dbg !19
  tail call void @__sanitize__(i32 %0, i32 5, i32 13), !dbg !19
  %div = sdiv i32 5, %0, !dbg !19
  tail call void @__coverage__(i32 5, i32 7), !dbg !16
  store i32 %div, i32* %y, align 4, !dbg !16
  tail call void @__coverage__(i32 6, i32 3), !dbg !20
  ret i32 0, !dbg !20
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @getchar() #2

declare void @__coverage__(i32, i32)

declare void @__sanitize__(i32, i32, i32)

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "simple8.c", directory: "/home/arun/ass/LLVMPlayground/part4_instrumentation/DivZeroInstrument/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocation(line: 4, column: 7, scope: !7)
!12 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 4, type: !10)
!13 = !DILocation(line: 4, column: 15, scope: !7)
!14 = !DILocation(line: 4, column: 13, scope: !7)
!15 = !DILocation(line: 4, column: 25, scope: !7)
!16 = !DILocation(line: 5, column: 7, scope: !7)
!17 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 5, column: 15, scope: !7)
!19 = !DILocation(line: 5, column: 13, scope: !7)
!20 = !DILocation(line: 6, column: 3, scope: !7)
