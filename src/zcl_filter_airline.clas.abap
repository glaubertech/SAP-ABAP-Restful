CLASS zcl_filter_airline DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit .
    INTERFACES if_sadl_exit_filter_transform .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_filter_airline IMPLEMENTATION.


  METHOD if_sadl_exit_filter_transform~map_atom.

    IF iv_element <> 'ISALLOWEDAIRLINE'.
      RETURN.
    ENDIF.

    "Create Instance Condition Factory
    DATA(lo_condition_factory) = cl_sadl_cond_prov_factory_pub=>create_simple_cond_factory( ).

    DATA(lo_element_airline) = lo_condition_factory->element( 'AIRLINEID' ).

    CASE iv_operator.

      WHEN if_sadl_exit_filter_transform~co_operator-equals        .
        ro_condition = lo_element_airline->equals( 'UA' ).

      WHEN if_sadl_exit_filter_transform~co_operator-is_null       .
        ro_condition = lo_element_airline->is_null( ).


      WHEN OTHERS.
        RETURN.
    ENDCASE.

  ENDMETHOD.
ENDCLASS.
