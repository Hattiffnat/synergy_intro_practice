class BaseClass:
    def method_1(self) -> int:
        return 2

    def method_for_overload(self) -> int:
        raise NotImplementedError("Implement me")

    def method_for_extension(self) -> int:
        return 3


class ChildClass(BaseClass):
    def method_2(self) -> int:
        return 3

    def method_for_overload(self) -> int:
        return 4

    def method_for_extension(self) -> int:
        return super().method_for_extension() + 10


if __name__ == "__main__":
    y = ChildClass()

    assert y.method_1() == 2
    assert y.method_2() == 3

    assert y.method_for_overload() == 4
    assert y.method_for_extension() == 13
