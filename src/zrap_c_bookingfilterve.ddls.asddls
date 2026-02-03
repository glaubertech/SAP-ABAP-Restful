@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Apply Filter with Virtual Element'

@Metadata.ignorePropagatedAnnotations: true

define root view entity ZRAP_C_BookingFilterVE
  provider contract transactional_query
  as projection on ZRAP_I_BookingFilterVE

{
  key     TravelID,
  key     BookingID,

          BookingDate,
          CustomerID,
          AirlineID,
          ConnectionID,
          FlightDate,

          @Semantics.amount.currencyCode: 'CurrencyCode'
          FlightPrice,

          CurrencyCode,

          @ObjectModel.filter.transformedBy: 'ABAP:ZCL_FILTER_AIRLINE'
          @ObjectModel.filter.enabled: true
          virtual IsAllowedAirline : boolean,

          /* Associations */
          _BookSupplement,
          _Carrier,
          _Connection,
          _Customer,
          _Travel
}
