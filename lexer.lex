%option noyywrap
%option noinput
%option nounput

%{
#include <iostream>
#include <string>
#include <cstdlib>

  using namespace std;

#include "parser.tab.hpp"
  
%}

belina [ \t]
slovo [a-zA-Z]
cifra [0-9]

%%
(#include){belina}*(<)({belina}*{slovo}+{belina}*)(>)  {
    string *s = new string(yytext);
    s->erase(0, s->find('<')+1);
    s->erase(s->size()-1, 1);
    yylval.s=s;
    return lib_token;
}

using{belina}*namespace{belina}*{slovo}+{belina}*;  {
    return name_token;
}

"int" {
    return int_token;
}

"main" {
    return main_token;
}

"double" {
    return double_token;
}

"cin" {
    return cin_token;
}

"cout"  {
    return cout_token;
}

"endl" {
    return endl_token;
}

"return" {
    return exit_token;
}

[/][/](.*)[\n]  {
    yylval.s = new string(yytext);    
    return jlkom_token;
}

[/][*](.|\n)*[*][/]  {
    yylval.s = new string(yytext);    
    return vlkom_token;
}

">=" {
    return vj_token;
}

"<=" {
    return mj_token;
}

"min" {
    return min_token;
}

"max" {
    return max_token;
}

"if" {
    return if_token;
}

"else" {
    return else_token;
}

["]([^"]*)["] {
    string *s = new string(yytext);
    s->erase(0, 1);
    s->erase((s->size())-1, 1);
    yylval.s = s;
    return str_token;
}

"<<"  {
    return opIspis_token;
}

">>"  {
    return opUpis_token;
}

[-+*/=(,)\'\"{};<>\n] {
    return *yytext;
}

[0-9]+(\.[0-9]+)?   {
    yylval.s = new string(yytext);
    return num_token;
}

[a-zA-Z_]+[a-zA-Z0-9_]* {
    yylval.s = new string(yytext);
    return id_token;
}
({belina})+ {
   
}

. {
    cout<<"neprepoznat karakter: "<<*yytext<<endl;
    exit(EXIT_FAILURE);
}
%%
/*
int main(){
yylex();

return 0;
}*/