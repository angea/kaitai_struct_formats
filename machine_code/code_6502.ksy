meta:
  id: code_6502
  license: CC0-1.0
  endian: le
doc: |
  This spec can be used to disassemble raw stream of 6502 CPU machine
  code into individual operations. Each operation includes an opcode
  and, optionally, an argument. Register arguments are part of the
  `opcode` enum.
seq:
  - id: operations
    type: operation
    repeat: eos
types:
  operation:
    seq:
      - id: code
        type: u1
        enum: opcode
      - id: args
        type:
          switch-on: code
          cases:
            'opcode::ora_x_ind': u1
            'opcode::ora_zpg': u1
            'opcode::asl_zpg': u1
            'opcode::ora_imm': u1
            'opcode::ora_abs': u2
            'opcode::asl_abs': u2
            'opcode::bpl_rel': s1
            'opcode::ora_ind_y': u1
            'opcode::ora_zpg_x': u1
            'opcode::asl_zpg_x': u1
            'opcode::ora_abs_y': u2
            'opcode::ora_abs_x': u2
            'opcode::asl_abs_x': u2
            'opcode::jsr_abs': u2
            'opcode::and_x_ind': u1
            'opcode::bit_zpg': u1
            'opcode::and_zpg': u1
            'opcode::rol_zpg': u1
            'opcode::and_imm': u1
            'opcode::bit_abs': u2
            'opcode::and_abs': u2
            'opcode::rol_abs': u2
            'opcode::bmi_rel': s1
            'opcode::and_ind_y': u1
            'opcode::and_zpg_x': u1
            'opcode::rol_zpg_x': u1
            'opcode::and_abs_y': u2
            'opcode::and_abs_x': u2
            'opcode::rol_abs_x': u2
            'opcode::eor_x_ind': u1
            'opcode::eor_zpg': u1
            'opcode::lsr_zpg': u1
            'opcode::eor_imm': u1
            'opcode::jmp_abs': u2
            'opcode::eor_abs': u2
            'opcode::lsr_abs': u2
            'opcode::bvc_rel': s1
            'opcode::eor_ind_y': u1
            'opcode::eor_zpg_x': u1
            'opcode::lsr_zpg_x': u1
            'opcode::eor_abs_y': u2
            'opcode::eor_abs_x': u2
            'opcode::lsr_abs_x': u2
            'opcode::adc_x_ind': u1
            'opcode::adc_zpg': u1
            'opcode::ror_zpg': u1
            'opcode::adc_imm': u1
            'opcode::jmp_ind': u2
            'opcode::adc_abs': u2
            'opcode::ror_abs': u2
            'opcode::bvs_rel': s1
            'opcode::adc_ind_y': u1
            'opcode::adc_zpg_x': u1
            'opcode::ror_zpg_x': u1
            'opcode::adc_abs_y': u2
            'opcode::adc_abs_x': u2
            'opcode::ror_abs_x': u2
            'opcode::sta_x_ind': u1
            'opcode::sty_zpg': u1
            'opcode::sta_zpg': u1
            'opcode::stx_zpg': u1
            'opcode::sty_abs': u2
            'opcode::sta_abs': u2
            'opcode::stx_abs': u2
            'opcode::bcc_rel': s1
            'opcode::sta_ind_y': u1
            'opcode::sty_zpg_x': u1
            'opcode::sta_zpg_x': u1
            'opcode::stx_zpg_y': u1
            'opcode::sta_abs_y': u2
            'opcode::sta_abs_x': u2
            'opcode::ldy_imm': u1
            'opcode::lda_x_ind': u1
            'opcode::ldx_imm': u1
            'opcode::ldy_zpg': u1
            'opcode::lda_zpg': u1
            'opcode::ldx_zpg': u1
            'opcode::lda_imm': u1
            'opcode::ldy_abs': u2
            'opcode::lda_abs': u2
            'opcode::ldx_abs': u2
            'opcode::bcs_rel': s1
            'opcode::lda_ind_y': u1
            'opcode::ldy_zpg_x': u1
            'opcode::lda_zpg_x': u1
            'opcode::ldx_zpg_y': u1
            'opcode::lda_abs_y': u2
            'opcode::ldy_abs_x': u2
            'opcode::lda_abs_x': u2
            'opcode::ldx_abs_y': u2
            'opcode::cpy_imm': u1
            'opcode::cmp_x_ind': u1
            'opcode::cpy_zpg': u1
            'opcode::cmp_zpg': u1
            'opcode::dec_zpg': u1
            'opcode::cmp_imm': u1
            'opcode::cpy_abs': u2
            'opcode::cmp_abs': u2
            'opcode::dec_abs': u2
            'opcode::bne_rel': s1
            'opcode::cmp_ind_y': u1
            'opcode::cmp_zpg_x': u1
            'opcode::dec_zpg_x': u1
            'opcode::cmp_abs_y': u2
            'opcode::cmp_abs_x': u2
            'opcode::dec_abs_x': u2
            'opcode::cpx_imm': u1
            'opcode::sbc_x_ind': u1
            'opcode::cpx_zpg': u1
            'opcode::sbc_zpg': u1
            'opcode::inc_zpg': u1
            'opcode::sbc_imm': u1
            'opcode::cpx_abs': u2
            'opcode::sbc_abs': u2
            'opcode::inc_abs': u2
            'opcode::beq_rel': s1
            'opcode::sbc_ind_y': u1
            'opcode::sbc_zpg_x': u1
            'opcode::inc_zpg_x': u1
            'opcode::sbc_abs_y': u2
            'opcode::sbc_abs_x': u2
            'opcode::inc_abs_x': u2
enums:
  opcode:
    0x00: brk_impl
    0x01: ora_x_ind
    0x05: ora_zpg
    0x06: asl_zpg
    0x08: php_impl
    0x09: ora_imm
    0x0a: asl_a
    0x0d: ora_abs
    0x0e: asl_abs
    0x10: bpl_rel
    0x11: ora_ind_y
    0x15: ora_zpg_x
    0x16: asl_zpg_x
    0x18: clc_impl
    0x19: ora_abs_y
    0x1d: ora_abs_x
    0x1e: asl_abs_x
    0x20: jsr_abs
    0x21: and_x_ind
    0x24: bit_zpg
    0x25: and_zpg
    0x26: rol_zpg
    0x28: plp_impl
    0x29: and_imm
    0x2a: rol_a
    0x2c: bit_abs
    0x2d: and_abs
    0x2e: rol_abs
    0x30: bmi_rel
    0x31: and_ind_y
    0x35: and_zpg_x
    0x36: rol_zpg_x
    0x38: sec_impl
    0x39: and_abs_y
    0x3d: and_abs_x
    0x3e: rol_abs_x
    0x40: rti_impl
    0x41: eor_x_ind
    0x45: eor_zpg
    0x46: lsr_zpg
    0x48: pha_impl
    0x49: eor_imm
    0x4a: lsr_a
    0x4c: jmp_abs
    0x4d: eor_abs
    0x4e: lsr_abs
    0x50: bvc_rel
    0x51: eor_ind_y
    0x55: eor_zpg_x
    0x56: lsr_zpg_x
    0x58: cli_impl
    0x59: eor_abs_y
    0x5d: eor_abs_x
    0x5e: lsr_abs_x
    0x60: rts_impl
    0x61: adc_x_ind
    0x65: adc_zpg
    0x66: ror_zpg
    0x68: pla_impl
    0x69: adc_imm
    0x6a: ror_a
    0x6c: jmp_ind
    0x6d: adc_abs
    0x6e: ror_abs
    0x70: bvs_rel
    0x71: adc_ind_y
    0x75: adc_zpg_x
    0x76: ror_zpg_x
    0x78: sei_impl
    0x79: adc_abs_y
    0x7d: adc_abs_x
    0x7e: ror_abs_x
    0x81: sta_x_ind
    0x84: sty_zpg
    0x85: sta_zpg
    0x86: stx_zpg
    0x88: dey_impl
    0x8a: txa_impl
    0x8c: sty_abs
    0x8d: sta_abs
    0x8e: stx_abs
    0x90: bcc_rel
    0x91: sta_ind_y
    0x94: sty_zpg_x
    0x95: sta_zpg_x
    0x96: stx_zpg_y
    0x98: tya_impl
    0x99: sta_abs_y
    0x9a: txs_impl
    0x9d: sta_abs_x
    0xa0: ldy_imm
    0xa1: lda_x_ind
    0xa2: ldx_imm
    0xa4: ldy_zpg
    0xa5: lda_zpg
    0xa6: ldx_zpg
    0xa8: tay_impl
    0xa9: lda_imm
    0xaa: tax_impl
    0xac: ldy_abs
    0xad: lda_abs
    0xae: ldx_abs
    0xb0: bcs_rel
    0xb1: lda_ind_y
    0xb4: ldy_zpg_x
    0xb5: lda_zpg_x
    0xb6: ldx_zpg_y
    0xb8: clv_impl
    0xb9: lda_abs_y
    0xba: tsx_impl
    0xbc: ldy_abs_x
    0xbd: lda_abs_x
    0xbe: ldx_abs_y
    0xc0: cpy_imm
    0xc1: cmp_x_ind
    0xc4: cpy_zpg
    0xc5: cmp_zpg
    0xc6: dec_zpg
    0xc8: iny_impl
    0xc9: cmp_imm
    0xca: dex_impl
    0xcc: cpy_abs
    0xcd: cmp_abs
    0xce: dec_abs
    0xd0: bne_rel
    0xd1: cmp_ind_y
    0xd5: cmp_zpg_x
    0xd6: dec_zpg_x
    0xd8: cld_impl
    0xd9: cmp_abs_y
    0xdd: cmp_abs_x
    0xde: dec_abs_x
    0xe0: cpx_imm
    0xe1: sbc_x_ind
    0xe4: cpx_zpg
    0xe5: sbc_zpg
    0xe6: inc_zpg
    0xe8: inx_impl
    0xe9: sbc_imm
    0xea: nop_impl
    0xec: cpx_abs
    0xed: sbc_abs
    0xee: inc_abs
    0xf0: beq_rel
    0xf1: sbc_ind_y
    0xf5: sbc_zpg_x
    0xf6: inc_zpg_x
    0xf8: sed_impl
    0xf9: sbc_abs_y
    0xfd: sbc_abs_x
    0xfe: inc_abs_x
