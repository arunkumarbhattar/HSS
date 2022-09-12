#include "Domain.h"

//===----------------------------------------------------------------------===//
// Abstract Domain Implementation
//===----------------------------------------------------------------------===//

/* Add your code here */

dataflow::Domain *dataflow::Domain::add(dataflow::Domain *E1, dataflow::Domain *E2) {
    if (E1->Value == Uninit || E2->Value == Uninit)
        return new Domain(Uninit);
    if (E1->Value == Zero && E2->Value == Zero)
        return new Domain(Zero);
    if (E1->Value == Zero && E2->Value == NonZero)
        return new Domain(NonZero);
    if (E1->Value == NonZero && E2->Value == Zero)
        return new Domain(NonZero);
    return new Domain(MaybeZero);
}

dataflow::Domain *dataflow::Domain::sub(dataflow::Domain *E1, dataflow::Domain *E2) {
    if (E1->Value == Uninit || E2->Value == Uninit)
        return new Domain(Uninit);
    if (E1->Value == Zero && E2->Value == Zero)
        return new Domain(Zero);
    if (E1->Value == Zero && E2->Value == NonZero)
        return new Domain(NonZero);
    if (E1->Value == NonZero && E2->Value == Zero)
        return new Domain(NonZero);
    return new Domain(MaybeZero);
}

dataflow::Domain *dataflow::Domain::mul(dataflow::Domain *E1, dataflow::Domain *E2) {
    if (E1->Value == Uninit || E2->Value == Uninit)
        return new Domain(Uninit);
    if (E1->Value == Zero || E2->Value == Zero)
        return new Domain(Zero);
    if (E1->Value == NonZero && E2->Value == NonZero)
        return new Domain(NonZero);
    return new Domain(MaybeZero);
}

dataflow::Domain *dataflow::Domain::div(dataflow::Domain *E1, dataflow::Domain *E2) {
    if (E1->Value == Uninit || E2->Value == Uninit)
        return new Domain(Uninit);
    if (E2->Value == Zero || E2->Value == MaybeZero)
        return new Domain(Uninit);
    if (E1->Value == NonZero)
        return new Domain(MaybeZero);
    if (E1->Value == Zero)
        return new Domain(Zero);
    return new Domain(MaybeZero);
}

dataflow::Domain *dataflow::Domain::join(dataflow::Domain *E1, dataflow::Domain *E2) {
    switch (E1->Value) {
        case Uninit:
            return new Domain(*E2);
        case NonZero:
            switch (E2->Value) {
                case Uninit:
                case NonZero:
                    return new Domain(NonZero);
                case Zero:
                case MaybeZero:
                    return new Domain(MaybeZero);
            }
        case Zero:
            switch (E2->Value) {
                case Uninit:
                case Zero:
                    return new Domain(Zero);
                case NonZero:
                case MaybeZero:
                    return new Domain(MaybeZero);
            }
        case MaybeZero:
            return new Domain(MaybeZero);
    }
}
