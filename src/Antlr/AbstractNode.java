package Antlr;
enum Color{
    red,
    blue,
    yellow,
    green,
    black,
    white
}
abstract class AbstractNode
{

}

abstract class ExpressionNode extends AbstractNode
{

}

abstract class StatementNode extends  AbstractNode{

}

abstract class FunctionDeclarationNode extends AbstractNode{

}

abstract class StrategyDeclarationNode extends AbstractNode{

}

abstract class DeclarationNode extends AbstractNode{

}

abstract class ConditionDeclarationNode extends AbstractNode{

}

abstract class ControlStructureNode extends AbstractNode{

}

abstract class InfixExpressionNode extends ExpressionNode{

}

class IfControlStructureNode extends ControlStructureNode{

}

class RobotPropertiesNode extends AbstractNode{
    public TextNode Name;
    public TextNode RobotType;

}

class GunColorNode extends AbstractNode{
    public ColorValNode Color;
}

class BodyColorNode extends AbstractNode{
    public ColorValNode Color;
}

class RadarColorNode extends AbstractNode{
    public ColorValNode Color;
}

class TextNode extends AbstractNode{
    public String Content;
}

class ColorValNode extends AbstractNode{
    public Color Color;
}

class NumberNode extends AbstractNode{
    public double Value;
}