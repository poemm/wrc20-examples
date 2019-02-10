(module
 (type $0 (func (param i32 i32)))
 (type $1 (func (result i32)))
 (type $2 (func (param i32 i32 i32)))
 (type $3 (func (param i32)))
 (type $4 (func))
 (type $5 (func (param i64) (result i64)))
 (memory $0 1)
 (import "ethereum" "revert" (func $fimport$0 (param i32 i32)))
 (import "ethereum" "finish" (func $fimport$1 (param i32 i32)))
 (import "ethereum" "getCallDataSize" (func $fimport$2 (result i32)))
 (import "ethereum" "callDataCopy" (func $fimport$3 (param i32 i32 i32)))
 (import "ethereum" "storageLoad" (func $fimport$4 (param i32 i32)))
 (import "ethereum" "storageStore" (func $fimport$5 (param i32 i32)))
 (import "ethereum" "getTxOrigin" (func $fimport$6 (param i32)))
 (import "ethereum" "getCaller" (func $fimport$7 (param i32)))
 (export "memory" (memory $0))
 (export "main" (func $0))
 (func $0 (; 8 ;) (type $4)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ge_u
      (call $fimport$2)
      (i32.const 4)
     )
    )
    (call $fimport$0
     (i32.const 0)
     (i32.const 0)
    )
    (br $label$1)
   )
   (call $fimport$3
    (i32.const 0)
    (i32.const 0)
    (i32.const 4)
   )
   (block $label$3
    (br_if $label$3
     (i32.eqz
      (i32.eq
       (i32.load
        (i32.const 0)
       )
       (i32.const 436376473)
      )
     )
    )
    (call $1)
    (br $label$1)
   )
   (block $label$4
    (br_if $label$4
     (i32.eqz
      (i32.eq
       (i32.load
        (i32.const 0)
       )
       (i32.const -1113639587)
      )
     )
    )
    (call $2)
    (br $label$1)
   )
   (call $fimport$0
    (i32.const 0)
    (i32.const 0)
   )
  )
 )
 (func $1 (; 9 ;) (type $4)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eq
      (call $fimport$2)
      (i32.const 24)
     )
    )
    (call $fimport$0
     (i32.const 0)
     (i32.const 0)
    )
    (br $label$1)
   )
   (call $fimport$3
    (i32.const 0)
    (i32.const 4)
    (i32.const 20)
   )
   (call $fimport$4
    (i32.const 0)
    (i32.const 32)
   )
   (i64.store
    (i32.const 32)
    (call $3
     (i64.load
      (i32.const 32)
     )
    )
   )
   (call $fimport$1
    (i32.const 32)
    (i32.const 8)
   )
  )
 )
 (func $2 (; 10 ;) (type $4)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eq
      (call $fimport$2)
      (i32.const 32)
     )
    )
    (call $fimport$0
     (i32.const 0)
     (i32.const 0)
    )
    (br $label$1)
   )
   (call $fimport$7
    (i32.const 0)
   )
   (call $fimport$3
    (i32.const 32)
    (i32.const 4)
    (i32.const 20)
   )
   (call $fimport$3
    (i32.const 64)
    (i32.const 24)
    (i32.const 8)
   )
   (set_local $0
    (call $3
     (i64.load
      (i32.const 64)
     )
    )
   )
   (call $fimport$4
    (i32.const 0)
    (i32.const 64)
   )
   (set_local $1
    (i64.load
     (i32.const 64)
    )
   )
   (call $fimport$4
    (i32.const 32)
    (i32.const 64)
   )
   (set_local $2
    (i64.load
     (i32.const 64)
    )
   )
   (block $label$3
    (br_if $label$3
     (i64.le_u
      (get_local $0)
      (get_local $1)
     )
    )
    (call $fimport$0
     (i32.const 0)
     (i32.const 0)
    )
    (br $label$1)
   )
   (set_local $1
    (i64.sub
     (get_local $1)
     (get_local $0)
    )
   )
   (set_local $2
    (i64.add
     (get_local $2)
     (get_local $0)
    )
   )
   (i64.store
    (i32.const 64)
    (get_local $1)
   )
   (call $fimport$5
    (i32.const 0)
    (i32.const 64)
   )
   (i64.store
    (i32.const 64)
    (get_local $2)
   )
   (call $fimport$5
    (i32.const 32)
    (i32.const 64)
   )
  )
 )
 (func $3 (; 11 ;) (type $5) (param $0 i64) (result i64)
  (local $1 i64)
  (local $2 i64)
  (block $label$1
   (loop $label$2
    (br_if $label$1
     (i64.ge_u
      (get_local $1)
      (i64.const 8)
     )
    )
    (set_local $2
     (i64.add
      (i64.shl
       (i64.shr_u
        (i64.shl
         (get_local $0)
         (i64.sub
          (i64.const 56)
          (i64.mul
           (get_local $1)
           (i64.const 8)
          )
         )
        )
        (i64.const 56)
       )
       (i64.sub
        (i64.const 56)
        (i64.mul
         (i64.const 8)
         (get_local $1)
        )
       )
      )
      (get_local $2)
     )
    )
    (set_local $1
     (i64.add
      (get_local $1)
      (i64.const 1)
     )
    )
    (br $label$2)
   )
  )
  (get_local $2)
 )
)

