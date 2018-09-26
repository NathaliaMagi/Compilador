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

campo_decl : var_campo_decl (VIRGU var_campo_decl)* PONTVIRG;

var_campo_decl : TIPO id|TIPO id COLCHETEESQ int_literal COLCHETEDIR;

metodo_decl: (TIPO|VOID) id PARENESQ (TIPO id(VIRGU TIPO id)*)? PARENDIR block;

block : CHAVEESQ var_decl* statement* CHAVEDIR;

var_decl : TIPO id (VIRGU id)* PONTVIRG;

statement : local assign_op expr PONTVIRG
	|metodo_call PONTVIRG
	|IF (expr) block (ELSE block)?
	|FOR id IGUAL expr VIRGU expr block
	|RETURN (expr)?PONTVIRG
	|BREAK PONTVIRG
	|CONTINUE PONTVIRG
	|block;

assign_op : IGUAL 
	|MAISUM
	|MENOSUM;

metodo_call : metodo_nome PARENESQ (expr (VIRGU expr)*)? PARENDIR
	|CALLOUT PARENESQ string_literal (VIRGU callout_arg (VIRGU callout_arg)*)? PARENDIR;

metodo_nome : id;

local : id
	|id COLCHETEESQ expr COLCHETEDIR;

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

id : ID;

int_literal : NUMBER|HEXA;

bool_literal : TRUE|FALSE;

char_literal : CHAR;

string_literal : STRING*;







