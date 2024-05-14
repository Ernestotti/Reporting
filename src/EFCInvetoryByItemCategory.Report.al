report 70201 EFCInvetoryByItemCategory
{
  Caption = 'Inventory and Availability, by Item Category';
  UsageCategory = ReportsAndAnalysis;
  ApplicationArea = All;
  DefaultRenderingLayout = InventoryByItemCategoryExcel;
  
  dataset
  {
    dataitem(Item; Item)
    {
      CalcFields = Inventory, "Qty. on Purch. Order", "Qty. on Sales Order";
      RequestFilterFields = "No.", Description, "Item Category Code";

      column(Item_Category_Code; "Item Category Code")
      {
      IncludeCaption = true;
      }
      // column(Item_Category_Desc; ItemCategoryDesc) { }
      column(No; "No.")
      {
      IncludeCaption = true;
      }
      column(Description; Description)
      {
      IncludeCaption = true;
      }
      column(Inventory; Inventory)
      {
      IncludeCaption = true;
      }
      column(Availability; Inventory + "Qty. on Purch. Order" + "Qty. on Sales Order") { }

      dataitem(ItemCategory; "Item Category")
      {
        DataItemLinkReference = Item;
        DataItemLink = Code = field("Item Category Code");
        DataItemTableView = sorting(Code);

        column(Description_ItemCategory; Description) { }
      }
      // trigger OnPreDataItem()
      // begin
      //   SetCurrentKey("Item Category Code");
      //   xItemCategoryCode := '######';
      // end;

      // trigger OnAfterGetRecord()
      // var
      //   ItemCategory: Record "Item Category";
      // Begin
      //   if "Item Category Code" <> xItemCategoryCode then begin
      //     xItemCategoryCode := "Item Category Code";
      //     Clear(ItemCategoryDesc);
      //     if ItemCategory.GET("Item Category Code") then
      //       ItemCategoryDesc := ItemCategory.Description;
      //   end;
      // end;
    }


  }

  rendering
  {
    // layout(InventoryByItemCategory)
    // {
    //   Caption = 'Inventory and Availability, by Item Category';
    //   Type = RDLC;
    //   LayoutFile = 'src/Layouts/EFCInventoryByItemCategory.rdl';
    // }
    layout(InventoryByItemCategoryExcel)
    {
      Caption = 'Inventory and Availability, by Item Category (Excel)';
      Type = Excel;
      LayoutFile = 'src/Layouts/EFCInventoryByItemCategoryExcel.xlsx';
    }
  }

  labels
  {
    TitleLbl = 'Inventory and Availability, by Item Category';
    AvailabilityLbl = 'Availability';
    InventoryLbl = 'Inventory';
    ItemCategoryCodeLbl = 'Item Category Code';
    ItemNoLbl = 'Item No.';
    ItemDescriptionLbl = 'Item Description';
  }

  // var
  //   xItemCategoryCode: Code[20];
  //   ItemCategoryDesc: Text;
}