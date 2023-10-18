CLASS lhc_shipreqitem DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ShipReqItem RESULT result.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ShipReqItem.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ShipReqItem.

    METHODS read FOR READ
      IMPORTING keys FOR READ ShipReqItem RESULT result.

    METHODS rba_Shipreq FOR READ
      IMPORTING keys_rba FOR READ ShipReqItem\_Shipreq FULL result_requested RESULT result LINK association_links.

ENDCLASS.


CLASS lhc_shipreqitem IMPLEMENTATION.
  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
    IF 1 = 2.

    ENDIF.
  ENDMETHOD.

  METHOD rba_Shipreq.
  ENDMETHOD.
ENDCLASS.


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

    METHODS rba_Shipreqitems FOR READ
      IMPORTING keys_rba FOR READ ShipReq\_Shipreqitems FULL result_requested RESULT result LINK association_links.

    METHODS cba_Shipreqitems FOR MODIFY
      IMPORTING entities_cba FOR CREATE ShipReq\_Shipreqitems.

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
    zrk_cl_ce_manage_shipreq=>get_instance( )->get_shipment_req_det( EXPORTING im_shipreq_no   = keys[ 1 ]-ShipReqNo
                                                                     IMPORTING es_shipreq_resp = DATA(ls_shipreq_det) ).

    APPEND INITIAL LINE TO result ASSIGNING FIELD-SYMBOL(<fs_result>).
    <fs_result>-%data = CORRESPONDING #( ls_shipreq_det ).
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Shipreqitems.
    IF 1 = 2.

    ENDIF.
  ENDMETHOD.

  METHOD cba_Shipreqitems.
  ENDMETHOD.
ENDCLASS.


CLASS lsc_ZRK_CE_I_SHIPREQ DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS finalize          REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS adjust_numbers    REDEFINITION.

    METHODS save              REDEFINITION.

    METHODS cleanup           REDEFINITION.

    METHODS cleanup_finalize  REDEFINITION.

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
