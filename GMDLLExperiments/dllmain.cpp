// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"

#include<iostream>

#define GMDLL extern "C" __declspec(dllexport)

GMDLL double DLLAddNumbers(double a, double b) {
	return a + b;
}

GMDLL void DLLPrintSomething(const char* message) {
	std::cout << message << std::endl;
}

GMDLL double DLLBufferSum(int* buffer, double length) {
	double total = 0;

	for (int i = 0; i < length; i++) {
		buffer[i] = 0;
	}

	return total;
}