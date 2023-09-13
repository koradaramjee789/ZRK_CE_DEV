CLASS lhc_ShipReq DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ShipReq RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE ShipReq.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ShipReq.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ShipReq.

    METHODS read FOR READ
      IMPORTING keys FOR READ ShipReq RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK ShipReq.

ENDCLASS.

CLASS lhc_ShipReq IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.

    zrk_cl_ce_manage_shipreq=>get_instance( )->get_shipment_req_det(
      EXPORTING
        im_shipreq_no   = keys[ 1 ]-ShipReqNo
      IMPORTING
        es_shipreq_resp = DATA(ls_shipreq_det)
    ).

    APPEND INITIAL LINE TO result ASSIGNING FIELD-SYMBOL(<fs_result>).
    <fs_result>-%data  = CORRESPONDING #( ls_shipreq_det ).
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZRK_CE_I_SHIPREQ DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS adjust_numbers REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZRK_CE_I_SHIPREQ IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD adjust_numbers.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
