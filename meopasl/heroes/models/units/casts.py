from typing import Optional, Union

from meopasl.heroes.models.units_stack import UnitsStack


# TODO: Implement methods


class Cast:
    def __repr__(self):
        """Represent cast to human-presentable view."""
        return '<Cast {}>'.format(self.__class__.__name__)


class Punish(Cast):
    def __call__(self, unit_stack: UnitsStack):
        pass


class Curse(Cast):
    def __call__(self, unit_stack: UnitsStack):
        pass


class Weak(Cast):
    def __call__(self, unit_stack: UnitsStack):
        pass


class Speed(Cast):
    def __call__(self, unit_stack: UnitsStack):
        pass


class Resurrection(Cast):
    def __call__(self, unit_stack: UnitsStack):
        pass


casts_type = Optional[Union[Punish, Curse, Weak, Speed, Resurrection]]
