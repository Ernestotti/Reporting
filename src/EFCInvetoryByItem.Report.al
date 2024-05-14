report 70200 EFCInvetoryByItem
{
  Caption = 'EFC Inventory by Item';
  UsageCategory = ReportsAndAnalysis;
  ApplicationArea = All;
  DefaultRenderingLayout = EFCInventoryByItem;
  
  dataset
  {
    dataitem(Item; Item)
    {
      column(No_Item; "No.")
      {
        IncludeCaption = true;
      }
      column(Description_Item; Description)
      {
        IncludeCaption = true;
      }
      column(Inventory_Item; Inventory)
      {
        IncludeCaption = true;
      }
    }
  }
  
  rendering
  {
    layout(EFCInventoryByItem)
    {
      Caption = 'EFC Inventory by Item';
      Type = RDLC;
      LayoutFile = 'src/Layouts/EFCInventoryByItem.rdl';
    }
  }

  labels
  {
    ItemNo = 'Nº';
  }
}