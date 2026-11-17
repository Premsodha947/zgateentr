@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unit of measure'
@Metadata.ignorePropagatedAnnotations: true
define view entity zI_UnitOfMeasureStdVH as select from I_UnitOfMeasureStdVH
{
        @Consumption.valueHelpDefinition: [{entity: {name: 'I_UnitOfMeasureStdVH', element: 'UnitOfMeasure'}}]
    key UnitOfMeasure,
        UnitOfMeasureLongName
}
