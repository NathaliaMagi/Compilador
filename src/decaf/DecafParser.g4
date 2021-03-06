parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program : CLASS PROGRAM CHAVEESQ campo_decl* metodo_decl* CHAVEDIR;

campo_decl : tipo ID (VIRGU tid)* PONTVIRG|tipo ID var_campo_decl(VIRGU tid var_campo_decl)* PONTVIRG;

var_campo_decl : COLCHETEESQ int_literal COLCHETEDIR;

metodo_decl: (tipo|VOID) ID PARENESQ (tid (VIRGU tid )*)? PARENDIR block;

block : CHAVEESQ var_decl* statement* CHAVEDIR;

virid : VIRGU ID;

var_decl : tipo ID (virid)* PONTVIRG;

tid : tipo ID;

tipo : TIPO;

statement : local assign_op expr PONTVIRG
	|metodo_call PONTVIRG
	|IF (expr) block (ELSE block)?
	|FOR ID IGUAL expr VIRGU expr block
	|RETURN (expr)?PONTVIRG
	|BREAK PONTVIRG
	|CONTINUE PONTVIRG
	|block;

assign_op : IGUAL 
	|MAISUM
	|MENOSUM;

metodo_call : ID PARENESQ (expr (VIRGU expr)*)? PARENDIR
	|CALLOUT PARENESQ string_literal (VIRGU callout_arg (VIRGU callout_arg)*)? PARENDIR;


local : ID
	|ID COLCHETEESQ expr COLCHETEDIR;

expr : local
	|metodo_call
	|literal
	|expr bin_op expr
	|SUBT expr
	|EXCLA expr
	|PARENESQ expr PARENDIR;

callout_arg : expr | string_literal;

bin_op : arith_op|rel_op |eq_op|cond_op;

arith_op : SOMA|SUBT|MULT|DIVISAO|PORCE;

rel_op : MENORQ|MAIORQ|MAIORIGUAL|MENORIGUAL;

eq_op : IGUALDADE|DIFEREN;

cond_op : AND|OU;

literal : int_literal|char_literal|bool_literal;

int_literal : NUMBER|HEXA;

bool_literal : TRUE|FALSE;

char_literal : CHAR;

string_literal : STRING*;







