from typing import List, Iterable
from copy import deepcopy

from .units_stack import UnitsStack


class Army:
    """Implements army, consisting maximum of 6 units stacks."""
    MAX_COUNT = 6

    class MaxCountUnitsException(Exception):
        """Exception matters, that max count of units reached."""
        def __init__(self):
            super().__init__("Max count of stacks in one army is {}"
                             .format(Army.MAX_COUNT))

    class StackNotFound(Exception):
        """Exception matters, that you trying ."""
        def __init__(self, stack):
            super().__init__("Stack {} cannot found in army.".format(stack))

    def __init__(self, stacks: List[UnitsStack]):
        """Initializes army.

        :param stacks: List of UnitsStack in Army.
        """
        if len(stacks) > self.MAX_COUNT:
            raise self.MaxCountUnitsException()
        self._stacks: List[UnitsStack] = stacks

    @property
    def stacks(self) -> List[UnitsStack]:
        """Getter for stack of units."""
        return deepcopy(self._stacks)

    def add_stack(self, stack: UnitsStack) -> None:
        """Adds stack of units to army.

        :param stack: Stack of units.
        """
        if len(self._stacks) + 1 > self.MAX_COUNT:
            raise self.MaxCountUnitsException()
        self._stacks.append(stack)

    def remove_stack(self, stack: UnitsStack) -> None:
        """Removes stack of units from army.

        :param stack: Stack of units.
        """
        try:
            self._stacks.remove(stack)
        except ValueError:
            raise self.StackNotFound(stack)

    def __contains__(self, stack: UnitsStack) -> bool:
        """Checks that army contains stack.

        :param stack: Stack of units.
        """
        return stack in self._stacks

    def __delitem__(self, stack: UnitsStack) -> None:
        """Removes stack of units from army.

        Hook for Army.remove_stack().

        :param stack: Stack of units.
        """
        self.remove_stack(stack)

    def __iter__(self) -> Iterable[UnitsStack]:
        """Iterates over stack of units."""
        return deepcopy(self._stacks).__iter__()

    def __repr__(self) -> str:
        """Represents army to human-presentable view."""
        return (
            '<Army with {} stacks: '.format(len(self._stacks))
            + ', '.join(repr(stack) for stack in self._stacks) + '>'
        )
