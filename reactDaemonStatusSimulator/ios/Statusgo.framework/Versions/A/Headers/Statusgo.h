/* Created by "go tool cgo" - DO NOT EDIT. */

/* package github.com/status-im/status-go/cmd/statusd */

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
typedef GoInt64 GoInt;
typedef GoUint64 GoUint;
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


extern char* CreateAccount(char* p0);

extern char* CreateChildAccount(char* p0, char* p1);

extern char* RecoverAccount(char* p0, char* p1);

extern char* Login(char* p0, char* p1);

extern char* Logout();

extern char* CompleteTransaction(char* p0, char* p1);

extern char* CompleteTransactions(char* p0, char* p1);

extern char* DiscardTransaction(char* p0);

extern char* DiscardTransactions(char* p0);

extern char* GenerateConfig(char* p0, int p1);

extern char* StartNode(char* p0);

extern char* StopNode();

extern char* ResumeNode();

extern char* ResetChainData();

extern char* StopNodeRPCServer();

extern char* StartNodeRPCServer();

extern void InitJail(char* p0);

extern char* Parse(char* p0, char* p1);

extern char* Call(char* p0, char* p1, char* p2);

extern void PopulateStaticPeers();

extern char* AddPeer(char* p0);

#ifdef __cplusplus
}
#endif
