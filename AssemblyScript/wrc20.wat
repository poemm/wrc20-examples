(module
  (type (;0;) (func))
  (type (;1;) (func (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32)))
  (type (;5;) (func (param i32)))
  (import "ethereum" "getCallDataSize" (func (;0;) (type 1)))
  (import "ethereum" "revert" (func (;1;) (type 2)))
  (import "ethereum" "callDataCopy" (func (;2;) (type 4)))
  (import "ethereum" "storageLoad" (func (;3;) (type 2)))
  (import "ethereum" "return" (func (;4;) (type 2)))
  (import "ethereum" "getCaller" (func (;5;) (type 5)))
  (import "ethereum" "storageStore" (func (;6;) (type 2)))
  (import "debug" "printMemHex" (func (;7;) (type 2)))
  (func (;8;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    get_local 0
    if  ;; label = @1
      get_local 0
      i32.const 1073741824
      i32.gt_u
      if  ;; label = @2
        unreachable
      end
      get_global 5
      set_local 1
      get_local 1
      get_local 0
      i32.add
      i32.const 7
      i32.add
      i32.const 7
      i32.const -1
      i32.xor
      i32.and
      set_local 2
      memory.size
      set_local 3
      get_local 2
      get_local 3
      i32.const 16
      i32.shl
      i32.gt_u
      if  ;; label = @2
        get_local 2
        get_local 1
        i32.sub
        i32.const 65535
        i32.add
        i32.const 65535
        i32.const -1
        i32.xor
        i32.and
        i32.const 16
        i32.shr_u
        set_local 4
        get_local 3
        tee_local 5
        get_local 4
        tee_local 6
        get_local 5
        get_local 6
        i32.gt_s
        select
        set_local 5
        get_local 5
        memory.grow
        i32.const 0
        i32.lt_s
        if  ;; label = @3
          get_local 4
          memory.grow
          i32.const 0
          i32.lt_s
          if  ;; label = @4
            unreachable
          end
        end
      end
      get_local 2
      set_global 5
      get_local 1
      return
    end
    i32.const 0)
  (func (;9;) (type 0)
    (local i32 i32)
    call 0
    i32.const 24
    i32.ne
    if  ;; label = @1
      i32.const 0
      i32.const 0
      call 1
    end
    i32.const 20
    call 8
    set_local 0
    get_local 0
    i32.const 4
    i32.const 20
    call 2
    i32.const 32
    call 8
    set_local 1
    get_local 0
    get_local 1
    call 3
    get_local 0
    i32.const 32
    call 7
    get_local 1
    i32.const 32
    call 7
    get_local 1
    i32.const 32
    call 4)
  (func (;10;) (type 0)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    call 0
    i32.const 32
    i32.ne
    if  ;; label = @1
      i32.const 0
      i32.const 0
      call 1
    end
    i32.const 32
    call 8
    set_local 0
    get_local 0
    call 5
    i32.const 32
    call 8
    set_local 1
    get_local 1
    i32.const 4
    i32.const 20
    call 2
    i32.const 32
    call 8
    set_local 2
    get_local 2
    i32.const 24
    i32.const 8
    call 2
    get_local 2
    i32.const 32
    call 7
    i32.const 32
    call 8
    set_local 3
    i32.const 32
    call 8
    set_local 4
    get_local 0
    get_local 3
    call 3
    get_local 1
    get_local 4
    call 3
    get_local 0
    i32.const 32
    call 7
    get_local 1
    i32.const 32
    call 7
    get_local 3
    i32.const 32
    call 7
    get_local 4
    i32.const 32
    call 7
    get_local 3
    i32.load
    set_local 5
    get_local 4
    i32.load
    set_local 6
    get_local 2
    i32.load
    set_local 7
    get_local 5
    get_local 7
    i32.lt_s
    if  ;; label = @1
      i32.const 0
      i32.const 0
      call 1
    end
    get_local 3
    get_local 5
    get_local 7
    i32.sub
    i32.store
    get_local 4
    get_local 6
    get_local 7
    i32.add
    i32.store
    get_local 0
    get_local 3
    call 6
    get_local 1
    get_local 4
    call 6)
  (func (;11;) (type 0)
    (local i32 i32 i32)
    call 0
    i32.const 4
    i32.lt_s
    if  ;; label = @1
      i32.const 0
      i32.const 0
      call 1
    end
    i32.const 4
    call 8
    set_local 0
    get_local 0
    i32.const 0
    i32.const 4
    call 2
    get_local 0
    i32.load
    set_local 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            get_local 1
            set_local 2
            get_local 2
            i32.const -1718418918
            i32.eq
            br_if 0 (;@4;)
            get_local 2
            i32.const 1563795389
            i32.eq
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          call 9
          br 2 (;@1;)
        end
        call 10
        br 1 (;@1;)
      end
      i32.const 0
      i32.const 0
      call 1
    end)
  (func (;12;) (type 0)
    get_global 6
    i32.const 7
    i32.add
    i32.const 7
    i32.const -1
    i32.xor
    i32.and
    set_global 4
    get_global 4
    set_global 5)
  (memory (;0;) 1)
  (global (;0;) i32 (i32.const 3))
  (global (;1;) i32 (i32.const 8))
  (global (;2;) i32 (i32.const 7))
  (global (;3;) i32 (i32.const 1073741824))
  (global (;4;) (mut i32) (i32.const 0))
  (global (;5;) (mut i32) (i32.const 0))
  (global (;6;) i32 (i32.const 8))
  (export "main" (func 11))
  (export "memory" (memory 0))
  (start 12))
