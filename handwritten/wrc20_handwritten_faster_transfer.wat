(module
  (func $revert (import "ethereum" "revert") (param i32 i32))
  (func $finish (import "ethereum" "finish") (param i32 i32))
  (func $getCallDataSize (import "ethereum" "getCallDataSize") (result i32))
  (func $callDataCopy    (import "ethereum" "callDataCopy") (param i32 i32 i32))
  (func $storageLoad     (import "ethereum" "storageLoad") (param i32 i32))
  (func $storageStore    (import "ethereum" "storageStore") (param i32 i32))
  (func $getCaller       (import "ethereum" "getCaller") (param i32))
  (memory (export "memory") 1)
  (func (export "main")
    block
      block
        call $getCallDataSize
        i32.const 4
        i32.ge_u
        br_if 0
        i32.const 0
        i32.const 0
        call $revert
        br 1
      end
      i32.const 0	;;selector, 4 bytes
      i32.const 0
      i32.const 4
      call $callDataCopy
      block
        i32.const 0	;;load selector
        i32.load
        i32.const 0x1a029399
        i32.eq
        i32.eqz
        br_if 0
        call $do_balance
        br 1
      end
      block
        i32.const 0	;;load selector
        i32.load
        i32.const 0xbd9f355d
        i32.eq
        i32.eqz
        br_if 0
        call $do_transfer
        br 1
      end
      i32.const 0
      i32.const 0
      call $revert
    end)
  (func $do_balance
    block
      block
        call $getCallDataSize
        i32.const 24
        i32.eq
        br_if 0
        i32.const 0
        i32.const 0
        call $revert
        br 1
      end
      i32.const	0	;;address to bytes 0-31, last 12 bytes are 0-padded
      i32.const 4
      i32.const 20
      call $callDataCopy
      i32.const 0	;; get token balance of address in bytes 0-31, put in bytes 32-63
      i32.const 32
      call $storageLoad
      i32.const 32	;; reverse bytes and put back in memory
      i32.const 32
      i64.load
      call $i64.reverse_bytes
      i64.store
      i32.const 32 	;; return first 8 bytes of balance
      i32.const 8
      call $finish
    end)
  (func $do_transfer
    (local i64 i64 i64)	;;sender_balance, recipient_balance, value
    block
      block
        call $getCallDataSize
        i32.const 32
        i32.eq
        br_if 0
        i32.const 0
        i32.const 0
        call $revert
        br 1
      end
      ;; memory bytes  0          32            64               
      ;;               senderAddy recipientAddy tmpForTokenValues
      i32.const 0 	;;sender address to bytes 0-19 (storage key uses bytes 0-31)
      call $getCaller
      i32.const	32	;;recipient address to bytes 32-51 (storage key uses bytes 32-63)
      i32.const 4
      i32.const 20
      call $callDataCopy
      i32.const	64	;;temporarily put transfer_value in bytes 64-71, reverse 8 msb, put in in local 0
      i32.const 24
      i32.const 8
      call $callDataCopy
      i32.const 64
      i64.load 
      call $i64.reverse_bytes
      set_local 0
      i32.const 0	;;temporarily put sender_balance into bytes 64-95, reverse 8 msb, put it in local 1
      i32.const 64
      call $storageLoad
      i32.const 64
      i64.load 
      set_local 1
      i32.const 32	;;temporarily put recipient_balance into bytes 64-95, reverse 8 msb, put in local 2
      i32.const 64
      call $storageLoad
      i32.const 64
      i64.load 
      set_local 2
      block ;; if transver_value < sender_balance, then revert
        get_local 0
        get_local 1
        i64.le_u
        br_if 0
        i32.const 0
        i32.const 0
        call $revert
        br 1
      end
      get_local 1	;;sender_balance -= value
      get_local 0
      i64.sub
      set_local 1
      get_local 2	;;recipient_balance += value
      get_local 0
      i64.add
      set_local 2
      i32.const 64 	;;reverse sender_balance, write to memory, put in storage
      get_local 1
      i64.store
      i32.const 0
      i32.const 64
      call $storageStore
      i32.const 64 	;;reverse recipient_balance, write to memory, put in storage
      get_local 2
      i64.store
      i32.const 32
      i32.const 64
      call $storageStore
    end)
  (func $i64.reverse_bytes (param i64) (result i64)
    (local i64 i64)	;;iter variable, val to return
    block
      loop
        get_local 1	;;iter variable
        i64.const 8
        i64.ge_u
        br_if 1
        get_local 0	;;original
        i64.const 56	;;shift left
        get_local 1
        i64.const 8
        i64.mul
        i64.sub
        i64.shl
        i64.const 56	;;shift right
        i64.shr_u
	i64.const 56	;;shift left
        i64.const 8
        get_local 1
        i64.mul
        i64.sub
        i64.shl
        get_local 2	;;update
        i64.add
        set_local 2
        get_local 1	;;iter+=1
        i64.const 1
        i64.add
        set_local 1
        br 0
      end
    end
    get_local 2
  )
)
