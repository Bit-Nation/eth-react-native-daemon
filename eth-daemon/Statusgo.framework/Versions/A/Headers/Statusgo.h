/* Created by "go tool cgo" - DO NOT EDIT. */

/* package github.com/status-im/status-go/lib */

/* Start of preamble from import "C" comments.  */




/* End of preamble from import "C" comments.  */


/* Start of boilerplate cgo prologue.  */

#ifndef GO_CGO_PROLOGUE_H
#define GO_CGO_PROLOGUE_H

typedef signed char GoInt8;
typedef unsigned char GoUint8;
typedef short GoInt16;
typedef unsigned short GoUint16;
typedef int GoInt32;
typedef unsigned int GoUint32;
typedef long long GoInt64;
typedef unsigned long long GoUint64;
typedef GoInt32 GoInt;
typedef GoUint32 GoUint;
typedef __SIZE_TYPE__ GoUintptr;
typedef float GoFloat32;
typedef double GoFloat64;
typedef float _Complex GoComplex64;
typedef double _Complex GoComplex128;

/*
  static assertion to make sure the file is being used on architecture
  at least with matching size of GoInt.
*/
#ifdef __LP64__
typedef char _check_for_64_bit_pointer_matching_GoInt[sizeof(void*)==64/8 ? 1:-1];
#else
typedef char _check_for_32_bit_pointer_matching_GoInt[sizeof(void*)==32/8 ? 1:-1];
#endif

typedef struct { const char *p; GoInt n; } GoString;
typedef void *GoMap;
typedef void *GoChan;
typedef struct { void *t; void *v; } GoInterface;
typedef struct { void *data; GoInt len; GoInt cap; } GoSlice;

#endif

/* End of boilerplate cgo prologue.  */

#ifdef __cplusplus
extern "C" {
#endif


//GenerateConfig for status node

extern char* GenerateConfig(char* p0, int p1, int p2);

//StartNode - start Status node

extern char* StartNode(char* p0);

//StopNode - stop status node

extern char* StopNode();

//ValidateNodeConfig validates config for status node

extern char* ValidateNodeConfig(char* p0);

//ResetChainData remove chain data from data directory

extern char* ResetChainData();

//CallRPC calls status node via rpc

extern char* CallRPC(char* p0);

//CreateAccount is equivalent to creating an account from the command line,
// just modified to handle the function arg passing

extern char* CreateAccount(char* p0);

//CreateChildAccount creates sub-account

extern char* CreateChildAccount(char* p0, char* p1);

//RecoverAccount re-creates master key using given details

extern char* RecoverAccount(char* p0, char* p1);

//VerifyAccountPassword verifies account password

extern char* VerifyAccountPassword(char* p0, char* p1, char* p2);

//Login loads a key file (for a given address), tries to decrypt it using the password, to verify ownership
// if verified, purges all the previous identities from Whisper, and injects verified key as shh identity

extern char* Login(char* p0, char* p1);

//Logout is equivalent to clearing whisper identities

extern char* Logout();

//CompleteTransaction instructs backend to complete sending of a given transaction

extern char* CompleteTransaction(char* p0, char* p1);

//CompleteTransactions instructs backend to complete sending of multiple transactions

extern char* CompleteTransactions(char* p0, char* p1);

//DiscardTransaction discards a given transaction from transaction queue

extern char* DiscardTransaction(char* p0);

//DiscardTransactions discards given multiple transactions from transaction queue

extern char* DiscardTransactions(char* p0);

//InitJail setup initial JavaScript

extern void InitJail(char* p0);

//CreateAndInitCell creates a new jail cell context and executes provided JavaScript code.

extern char* CreateAndInitCell(char* p0, char* p1);

//ExecuteJS allows to run arbitrary JS code within a cell.

extern char* ExecuteJS(char* p0, char* p1);

//Call executes given JavaScript function

extern char* Call(char* p0, char* p1, char* p2);

//StartCPUProfile runs pprof for cpu

extern char* StartCPUProfile(char* p0);

//StopCPUProfiling stops pprof for cpu

extern char* StopCPUProfiling();

//WriteHeapProfile starts pprof for heap

extern char* WriteHeapProfile(char* p0);

// Notify sends push notification by given token
// @deprecated

extern char* Notify(char* p0);

// NotifyUsers sends push notifications by given tokens.

extern char* NotifyUsers(char* p0, char* p1, char* p2);

#ifdef __cplusplus
}
#endif
