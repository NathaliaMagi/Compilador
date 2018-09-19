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

campo_decl : TIPO ID PONTVIRG;

tipo : INT | BOOLEAN;

metodo_decl: (tipo|VOID) id PARENESQ (tipo id(VIRGU tipo id)*)? PARENDIR block;

block : CHAVEESQ var_decl* statement* CHAVEDIR;

var_decl : tipo id (VIRGU id)* PONTVIRG;



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
	|TRACO expr
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

digito : NUMBER;

hex_digito : NUMBER;

int_literal : decimal_literal|hex_literal;

decimal_literal : NUMBER NUMBER*;

hex_literal : HEXA HEXA*;

bool_literal : TRUE|FALSE;

char_literal : CHAR*;

string_literal : STRING*;







