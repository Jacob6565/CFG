package Antlr;

import java.beans.Statement;

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
    //Should contain management functions.
    public void connectSibling()
    {

    }
    public void adoptChildren()
    {

    }
    public void traverseAST()
    {

    }

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
    public ExpressionNode LeftChild;
    public ExpressionNode RightChild;
}







class IfControlStructureNode extends ControlStructureNode{

}

class WhileNode extends ControlStructureNode{

}

class ForNode extends  ControlStructureNode{

}

class RoutineNode extends ControlStructureNode{

}

class RobotPropertiesNode extends AbstractNode{
    public TextNode Name;
    public TextNode RobotType;
    public GunColorNode GunColor;
    public BodyColorNode BodyColor;
    public RadarColorNode RadarColor;
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

class NumberNode extends ExpressionNode{
    public double Value;
}

class BoolNode extends ExpressionNode{

}

class AdditionNode extends InfixExpressionNode{

}

class SubtractionNode extends InfixExpressionNode{

}

class MultiplicationNode extends InfixExpressionNode{

}

class DivisionNode extends InfixExpressionNode{

}

class PowerNode extends InfixExpressionNode{
    /* ex 3^4 */
}

class NotNode extends ExpressionNode{
    public ExpressionNode Expression;
}

class AndNode extends InfixExpressionNode{

}

class OrNode extends InfixExpressionNode{

}

class ModuloNode extends InfixExpressionNode{

}

class AssignNode extends StatementNode{

}

class FuncCallNode extends StatementNode{

}

class ReturnNode extends StatementNode{

}

class NumberDeclarationNode extends DeclarationNode{ //Jeg ved ikke om vi skal lave typechecking endnu

}

class TextDeclarationNode extends DeclarationNode{

}

class BooleanDeclarationNode extends DeclarationNode{

}