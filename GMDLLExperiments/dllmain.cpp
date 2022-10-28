// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"

#include<iostream>

#define GMDLL extern "C" __declspec(dllexport)

GMDLL double DLLAddNumbers(double a, double b) {
	return a + b;
}

GMDLL void DLLPrintSomething() {
	std::cout << "We are printing to the console from C++ land.\n" << std::endl;
}