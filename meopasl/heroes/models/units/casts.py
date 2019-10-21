from typing import Optional, Union

# TODO: Implement methods


class Cast:
    def __repr__(self):
        """Represent cast to human-presentable view."""
        return '<Cast {}>'.format(self.__class__.__name__)


# noinspection PyUnresolvedReferences
class Punish(Cast):
    def __call__(self, unit_stack: 'UnitsStack'):
        pass


# noinspection PyUnresolvedReferences
class Curse(Cast):
    def __call__(self, unit_stack: 'UnitsStack'):
        pass


# noinspection PyUnresolvedReferences
class Weak(Cast):
    def __call__(self, unit_stack: 'UnitsStack'):
        pass


# noinspection PyUnresolvedReferences
class Speed(Cast):
    def __call__(self, unit_stack: 'UnitsStack'):
        pass


# noinspection PyUnresolvedReferences
class Resurrection(Cast):
    def __call__(self, unit_stack: 'UnitsStack'):
        pass


casts_type = Optional[Union[Punish, Curse, Weak, Speed, Resurrection]]
