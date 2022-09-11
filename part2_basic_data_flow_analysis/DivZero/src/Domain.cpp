#include "Domain.h"

//===----------------------------------------------------------------------===//
// Abstract Domain Implementation
//===----------------------------------------------------------------------===//

/* Add your code here */

dataflow::Domain *dataflow::Domain::add(dataflow::Domain *E1, dataflow::Domain *E2) {
    if ((E1->Value == Uninit) && (E2->Value == Uninit))
        return new Domain(MaybeZero);
    else if ((E1->Value == Uninit) && (E2->Value == Zero))
        return new Domain(MaybeZero);
    else if ((E1->Value == Uninit) && (E2->Value == NonZero))
        return new Domain(MaybeZero);
    else if((E1->Value == Uninit) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    else if((E1->Value == NonZero) && (E2->Value == Uninit))
        return new Domain(MaybeZero);
    else if((E1->Value == NonZero) && (E2->Value == NonZero))
        return new Domain(NonZero);
    else if((E1->Value == NonZero) && (E2->Value == Zero))
        return new Domain(NonZero);
    else if((E1->Value == NonZero) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    else if((E1->Value == Zero) && (E2->Value == Uninit))
        return new Domain(Uninit);
    else if((E1->Value == Zero) && (E2->Value == NonZero))
        return new Domain(NonZero);
    else if((E1->Value == Zero) && (E2->Value == Zero))
        return new Domain(Zero);
    else if((E1->Value == Zero) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == Uninit))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == NonZero))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == Zero))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    return new Domain();
}

dataflow::Domain *dataflow::Domain::sub(dataflow::Domain *E1, dataflow::Domain *E2) {
    if ((E1->Value == Uninit) && (E2->Value == Uninit))
        return new Domain(MaybeZero);
    else if ((E1->Value == Uninit) && (E2->Value == Zero))
        return new Domain(MaybeZero);
    else if ((E1->Value == Uninit) && (E2->Value == NonZero))
        return new Domain(MaybeZero);
    else if((E1->Value == Uninit) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    else if((E1->Value == NonZero) && (E2->Value == Uninit))
        return new Domain(MaybeZero);
    else if((E1->Value == NonZero) && (E2->Value == NonZero))
        return new Domain(MaybeZero);
    else if((E1->Value == NonZero) && (E2->Value == Zero))
        return new Domain(NonZero);
    else if((E1->Value == NonZero) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    else if((E1->Value == Zero) && (E2->Value == Uninit))
        return new Domain(MaybeZero);
    else if((E1->Value == Zero) && (E2->Value == NonZero))
        return new Domain(NonZero);
    else if((E1->Value == Zero) && (E2->Value == Zero))
        return new Domain(Zero);
    else if((E1->Value == Zero) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == Uninit))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == NonZero))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == Zero))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    return new Domain();
}

dataflow::Domain *dataflow::Domain::mul(dataflow::Domain *E1, dataflow::Domain *E2) {
    if ((E1->Value == Uninit) && (E2->Value == Uninit))
        return new Domain(MaybeZero);
    else if ((E1->Value == Uninit) && (E2->Value == Zero))
        return new Domain(MaybeZero);
    else if ((E1->Value == Uninit) && (E2->Value == NonZero))
        return new Domain(MaybeZero);
    else if((E1->Value == Uninit) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    else if((E1->Value == NonZero) && (E2->Value == Uninit))
        return new Domain(MaybeZero);
    else if((E1->Value == NonZero) && (E2->Value == NonZero))
        return new Domain(NonZero);
    else if((E1->Value == NonZero) && (E2->Value == Zero))
        return new Domain(Zero);
    else if((E1->Value == NonZero) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    else if((E1->Value == Zero) && (E2->Value == Uninit))
        return new Domain(Zero);
    else if((E1->Value == Zero) && (E2->Value == NonZero))
        return new Domain(Zero);
    else if((E1->Value == Zero) && (E2->Value == Zero))
        return new Domain(Zero);
    else if((E1->Value == Zero) && (E2->Value == MaybeZero))
        return new Domain(Zero);
    else if((E1->Value == MaybeZero) && (E2->Value == Uninit))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == NonZero))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == Zero))
        return new Domain(Zero);
    else if((E1->Value == MaybeZero) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    return new Domain();
}

dataflow::Domain *dataflow::Domain::div(dataflow::Domain *E1, dataflow::Domain *E2) {
    if ((E1->Value == Uninit) && (E2->Value == Uninit))
        return new Domain(Uninit);
    else if ((E1->Value == Uninit) && (E2->Value == Zero))
        return new Domain(Uninit);
    else if ((E1->Value == Uninit) && (E2->Value == NonZero))
        return new Domain(Uninit);
    else if((E1->Value == Uninit) && (E2->Value == MaybeZero))
        return new Domain(Uninit);
    else if((E1->Value == NonZero) && (E2->Value == Uninit))
        return new Domain(Uninit);
    else if((E1->Value == NonZero) && (E2->Value == NonZero))
        return new Domain(NonZero);
    else if((E1->Value == NonZero) && (E2->Value == Zero))
        return new Domain(NonZero);
    else if((E1->Value == NonZero) && (E2->Value == MaybeZero))
        return new Domain(NonZero);
    else if((E1->Value == Zero) && (E2->Value == Uninit))
        return new Domain(Zero);
    else if((E1->Value == Zero) && (E2->Value == NonZero))
        return new Domain(Zero);
    else if((E1->Value == Zero) && (E2->Value == Zero))
        return new Domain(Zero);
    else if((E1->Value == Zero) && (E2->Value == MaybeZero))
        return new Domain(Zero);
    else if((E1->Value == MaybeZero) && (E2->Value == Uninit))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == NonZero))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == Zero))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    return new Domain();
}

dataflow::Domain *dataflow::Domain::join(dataflow::Domain *E1, dataflow::Domain *E2) {
    if ((E1->Value == Uninit) && (E2->Value == Uninit))
        return new Domain(Uninit);
    else if ((E1->Value == Uninit) && (E2->Value == Zero))
        return new Domain(Uninit);
    else if ((E1->Value == Uninit) && (E2->Value == NonZero))
        return new Domain(Uninit);
    else if((E1->Value == Uninit) && (E2->Value == MaybeZero))
        return new Domain(Uninit);
    else if((E1->Value == NonZero) && (E2->Value == Uninit))
        return new Domain(Uninit);
    else if((E1->Value == NonZero) && (E2->Value == NonZero))
        return new Domain(NonZero);
    else if((E1->Value == NonZero) && (E2->Value == Zero))
        return new Domain(Zero);
    else if((E1->Value == NonZero) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    else if((E1->Value == Zero) && (E2->Value == Uninit))
        return new Domain(Uninit);
    else if((E1->Value == Zero) && (E2->Value == NonZero))
        return new Domain(Zero);
    else if((E1->Value == Zero) && (E2->Value == Zero))
        return new Domain(Zero);
    else if((E1->Value == Zero) && (E2->Value == MaybeZero))
        return new Domain(Zero);
    else if((E1->Value == MaybeZero) && (E2->Value == Uninit))
        return new Domain(Uninit);
    else if((E1->Value == MaybeZero) && (E2->Value == NonZero))
        return new Domain(MaybeZero);
    else if((E1->Value == MaybeZero) && (E2->Value == Zero))
        return new Domain(Zero);
    else if((E1->Value == MaybeZero) && (E2->Value == MaybeZero))
        return new Domain(MaybeZero);
    return new Domain();
}
