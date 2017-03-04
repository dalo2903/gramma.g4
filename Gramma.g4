program: (vardec)* funcdecs;
funcdecs: (funcdec)+ mainfunc;

vardec: type listvar SEMICOLON ;
listvar: variable COMMA listvar | variable;
variable: ID | ID LB INTLIT RB;

funcdec: type funcname LR listparam RR blockstm ;

listparam: paramdecs | ;
paramdecs: paramdec COMMA paramdecs | paramdec ;
paramdec: type ID | type ID LB RB ;
blockstm: LP decpart stmpart RP ;
decpart: (vardec)*;
stmpart: (statement)*;



//expression
exp: exp ASSIGNOP exp1|exp1;
exp1: exp1 OROP exp2|exp2;
exp2: exp2 ANDOP exp3|exp3;
exp3: exp3 EQUALOP exp4|exp4 EQUALOP exp3|exp4;
exp4: exp4 RELAOP exp5|exp4 RELAOP exp5|exp5;
exp5: exp5 ADDOP exp6|exp6;
exp6: exp5 MULOP EXP7|exp7;
exp7: ADDOP exp |NOTOP exp | INTLIT|FLOATLIT|TRUELIT|FALSELIT;



//statement
statement: ifstm|forstm|reunstm|breakstm|continuestm|returnstm|expstm|cmpstm;
ifstm: IF LR boolexp RR statement else statement|IF LR boolexp RR cmpstm else cmpstm;
reunstm: REPEAT liststm UNTIL LR boolexp RR SEMICOLON|REPEAT cmpstm UNTIL LR boolexp RR SEMICOLON;
liststm: statement SEMICOLON liststm|statement;
forstm: FOR LR boolexplist RR statement |FOR LR boolexplist RR cmpstm;
boolexplist: boolexp SEMICOLON boolexplist| boolexp;
breakstm: BREAK SEMICOLON;
continuestm: CONTINUE SEMICOLON;
returnstm: voidreturnstm|nonvoidreturnstm;
voidreturnstm: RETURN SEMICOLON;
nonvoidreturnstm: RETURN exp SEMICOLON;
expstm: exp SEMICOLON;

cmpstm: LP statement+ RP;

//types



//variables:




//token sets
ID: [_a-zA-Z][_a-zA-Z0-9]*;

//keywords
BOOLEAN: 'boolean';
BREAK: 'break';
CONTINUE: 'continue';
FOR: 'for';
ELSE: 'else';
FLOAT: 'float';
IF: 'if';
INT: 'int';
RETURN: 'return';
VOID: 'void';
REPEAT: 'repeat';
UNTIL: 'until';
TRUE: 'true';
FALSE: 'false';

//operators
//arith
ADDOP: [+-];
MULOP: [*/];
RELAOP: '<'|'<='|'>'|'>=';
EQUALOP: '=='|'!=';
//logic
OROP: '||';
ANDOP: '&&';
NOTOP: '!';
ASSIGNOP: '=';

//seperators
LR: '(';
RR: ')';
LP: '{';
RP: '}';
LB: '[';
RB: ']';
COMMA: ',';
SEMICOLON: ';';

//literals
INTLIT: [0-9]+;
FLOATLIT:[0-9]*'.'[0-9]*|[0-9]*(e|E)[0-9]*

TRUELIT: 'true';
FALSELIT: 'false';

STRINGLIT: '"'.*'"'