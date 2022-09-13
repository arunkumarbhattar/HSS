#include "Domain.h"

//===----------------------------------------------------------------------===//
// Abstract Domain Implementation
//===----------------------------------------------------------------------===//

/* Add your code here */

dataflow::Domain *dataflow::Domain::add(dataflow::Domain *E1, dataflow::Domain *E2) {
    if (E1->Value == Uninit || E2->Value == Uninit)
        return new Domain(Uninit);

    if(E2->Value == Uninit)
        return new Domain(Uninit);

    if (E1->Value == Zero)
    {
        if (E2->Value == Zero)
            return new Domain(Zero);
        if (E2->Value == NonZero)
            return new Domain(NonZero);
    }

    if (E1->Value == NonZero && (E2->Value == Zero
    || E2->Value == NonZero))
        return new Domain(NonZero);

    return new Domain(MaybeZero);
}

dataflow::Domain *dataflow::Domain::sub(dataflow::Domain *E1, dataflow::Domain *E2) {
    if (E1->Value == Uninit || E2->Value == Uninit)
        return new Domain(Uninit);

    if (E1->Value == Zero)
    {
        if (E2->Value == Zero)
            return new Domain(Zero);

        if ( E2->Value == NonZero)
            return new Domain(NonZero);
    }
    if (E1->Value == NonZero && E2->Value == Zero)
        return new Domain(NonZero);

    return new Domain(MaybeZero);
}

dataflow::Domain *dataflow::Domain::mul(dataflow::Domain *E1, dataflow::Domain *E2) {
    if (E1->Value == Uninit || E2->Value == Uninit)
        return new Domain(Uninit);

    if (E1->Value == Zero)
    {
        if (E2->Value == Zero)
            return new Domain(Zero);

        if (E2->Value == NonZero)
            return new Domain(NonZero);
    }

    return new Domain(MaybeZero);
}

dataflow::Domain *dataflow::Domain::div(dataflow::Domain *E1, dataflow::Domain *E2) {
    if (E1->Value == Uninit || E2->Value == Uninit)
        return new Domain(Uninit);
    else if (E1->Value == NonZero/* || E2 is dont care. We finna gon approximate the
 * worst possible when denominator gon go infinity*/)
        return new Domain(MaybeZero);
    else if (E2->Value == MaybeZero || E2->Value == Zero)
    {
        /*
         * Finna cant do nothing bout this
         */
        return new Domain(Uninit);
    }
    else if (E1->Value == Zero)
        return new Domain(Zero);
    else
        return new Domain(MaybeZero);
}

dataflow::Domain *dataflow::Domain::join(dataflow::Domain *E1, dataflow::Domain *E2) {
    if (E1->Value == Uninit)
            return new Domain(*E2);
    else if (E1->Value == NonZero) {
        if (E2->Value == Uninit)
            return new Domain(NonZero);
        else if (E2->Value == NonZero)
            return new Domain(NonZero);
        else if (E2->Value == Zero)
            return new Domain(MaybeZero);
        else if (E2->Value == MaybeZero)
            return new Domain(MaybeZero);
    }
    else if (E1->Value == Zero)
    {
        if (E2->Value == Uninit)
            return new Domain(Zero);
        else if (E2->Value == Zero)
            return new Domain(Zero);
        else if (E2->Value == NonZero)
            return new Domain(MaybeZero);
        else if (E2->Value == MaybeZero)
            return new Domain(MaybeZero);
    }
    else
        return new Domain(MaybeZero);
}
