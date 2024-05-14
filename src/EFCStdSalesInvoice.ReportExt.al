reportextension 70000 EFCStdSalesInvoice extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Header)
        {
            column(EFCOrderNo; "Order No.")
            {
                IncludeCaption = true;
            }
            column(ShowOrder; ShowOrder) { }
        }
    }

    requestpage
    {
        layout
        {
            addlast(Options)
            {
                field(EFCShowOrder;  ShowOrder)
                {
                    Caption = 'Show order';
                    Tooltip = 'Show Order';
                    ApplicationArea = All;
                }
            }
        }
    }

    rendering
    {
        layout(EFCSalesInvoice)
        {
            Caption = 'Solutiza Sales - Invoice';
            Type = RDLC;
            LayoutFile = 'src/Layouts/EFCSalesInvoice.rdl';
        }
    }

    var
        ShowOrder: Boolean;
}
