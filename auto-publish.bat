@echo off
 
title Ⱥ������~��վ���¿�ݷ���
color 3
echo ��ǰĿ¼��%cd%
echo;
 echo;
echo ��ʼadd...
git add .
echo;
 
echo add���!
echo;

:: set /p declation=������commit��Ϣ:
:: git commit -m "%declation%"
:: echo;
 
echo ����commit...
git commit -m "routine update"
echo;

echo ���ڽ�commit�ύ��Զ�̷�����...
git push -u github main
echo;
 
echo ������ϣ�
echo;
 
pause