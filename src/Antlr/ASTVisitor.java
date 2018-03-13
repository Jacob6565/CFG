package Antlr;

public abstract class ASTVisitor<T>
{
    //Har en overloaded visitmetoder for hver node.
    public abstract T visit(AdditionNode node);
    //Osv.
}