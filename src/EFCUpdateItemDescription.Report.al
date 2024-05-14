report 70001 EFCUpdateItemDescription
{
    ApplicationArea = All;
    Caption = 'EFCUpdateItemDescription';
    UsageCategory = Tasks;
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", Description;

            trigger OnAfterGetRecord()
            var
                ItemModified: Record Item;
                NewDescription2Txt: Label '%1 (%2)', Comment = '%1=Description, %2=ItemNo';
                begin
                    "Description 2" := CopyStr(StrSubstNo(NewDescription2Txt, Description, "No."), 1, MaxStrLen("Description 2"));
                    if Modify(false) then
                        ItemsModified += 1;
                end;

        }
    }
    trigger OnPostReport()
    var
        ItemModifiedMsg: Label '%1 records were modified.', Comment = '%1=Records';
        begin
            Message(ItemModifiedMsg, ItemsModified);
        end;

        var
            ItemsModified: Integer;
}
