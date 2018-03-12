grammar CFG;
//Lexer rules
RobotProperty       : 'GunColor' | 'BodyColor' | 'RadarColor' | 'RobotType' ;
RobotTypeVal	    : 'advancedRobot' | 'juniorRobot' | 'robot' ;
ColorVal	        : 'red' | 'blue' | 'yellow' | 'green' | 'black' | 'white' ;
Type		        : 'number' | 'text' | 'bool' | 'number[]'
                    |'text[]' | 'bool[]' ;
EType 		        : 'BattleEndedEvent' | 'BulletHitBulletEvent'
                    | 'BulletHitEvent' | 'BulletMissedEvent' | 'CustomEvent'
                    | 'DeathEvent' | 'HitByBulletEvent' | 'HitRobotEvent'
                    | 'HitWallEvent' | 'KeyEvent' | 'MessageEvent' | 'MouseEvent'
                    | 'PaintEvent' | 'RobotDeathEvent' | 'RoundEndedEvent'
                    | 'ScannedRobotEvent' | 'SkippedTurnEvent' | 'StatusEvent'
                    | 'WinEvent'
                    ;
SingleLineComment   : '//' [\u0000-\u007Eæøå]* -> skip;
MultiLineComment    : '/*' ([\u0000-\u007Eæøå]* '*')* '/' -> skip;
WhiteSpace          : [ \r\n\t]+ -> skip;
Val	                : [-]? [0-9]+ ('.' [0-9]+)?
                    | '"' [\u0020-\u0021\u0023-\u007E]* '"'
                    ;
AdditiveOp	        : Plus | Minus ;
MultiOp             : Times | Divide | Modulo ;
Plus                : '+';
Minus               : '-';
Times               : '*';
Divide              : '/';
Modulo              : '%';
BoolVal             : TRUE | FALSE
                    ;
RelativeOp		    : '<' | '>' | '<=' | '>=' | '!=' | '==' ;
BoolOp	            : 'and' | 'or' ;
TRUE                : 'true' ;
FALSE               : 'false' ;
Name                : [A-z][A-z0-9]*;


//Parser rules
prog                : robotDcl (dcl | funcDcl | strategydcl | conditionDcl)*
                    ;
strategydcl     	: 'strategy' id '(' fParamList? ')' '{' (dcl | stmt | routine | when)* '}'
                    ;
funcDcl	            : funcType id '(' fParamList? ')' funcBody
                    ;
funcType	        : 'void'
                    | Type
                    ;
funcBody 	        :'{' (dcl | stmt)* '}'
                    ;
fParamList          : Type id
                    | Type id ',' fParamList
                    ;
robotDcl 	        : 'RobotProperties' '{' robotDclBody '}'
                    ;
robotDclBody        : 'RobotName' ':' id ';' 'RobotType' ':' RobotTypeVal ';' (RobotProperty ':' ColorVal ';')*
                    ;
dcl                 : Type id '=' expr ';'
                    | Type id (',' id)* ';'
                    ;
stmt		        : assignStmt ';'
                    | funcCall ';'
                    | ctrlStruct
                    | 'return' expr ';'
                    ;
routine	            : 'routine' '(' (Val | id)? ')' funcBody
                    ;
when		        : 'when' '(' (eParam | id id) ')' funcBody
                    ;
expr                : '(' expr ')'
                    | '!' expr
                    | <assoc=right> expr '^' expr
                    | expr MultiOp expr
                    | expr AdditiveOp expr
                    | expr RelativeOp expr
                    | expr BoolOp expr
                    | Val
                    | BoolVal
                    | id
                    | funcCall
                    ;
assignStmt	        : id '=' expr
                    ;
funcCall	        : id '(' aParamList? ')'
                    ;
conditionDcl        : 'condition' id '(' fParamList? ')' funcBody
                    ;
aParamList          : expr (',' aParamList)?
                    ;
ctrlStruct          : if (elseif)* (else)?
                    | 'for' '(' (dcl | Val | id) ('upto' | 'downto') (Val | id)')' funcBody
                    | 'while' '('expr')' funcBody
                    | routine
                    ;
if                  : 'if' '(' expr ')' funcBody
                    ;
elseif              : 'else if' '(' expr ')'  funcBody
                    ;
else                : 'else'  funcBody
                    ;
eParam  	        : EType id
                    ;
id                  : Name ( '.' id)?
                    | Name '[' Val ']'
                    ;