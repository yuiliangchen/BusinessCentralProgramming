page 50103 "Course List"
{
    PageType = List;
    SourceTable = Course;
    CardPageId = "Course Card";
    Editable = false;
    Caption = 'Course List';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;

                }
                field(Name; Name)
                {
                    ApplicationArea = All;

                }
                field(Description; Description)
                {
                    ApplicationArea = All;

                }
                field(Level; Level)
                {
                    ApplicationArea = All;

                }
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;

                }
                field(SPA; SPA)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
            }
            action("Insert Table")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'Insert Table';

                trigger onAction();
                begin
                    InsertNewRecord();
                end;
            }
        }
    }

    var
        Level: text[30];
        Suggestion: text[80];
        SPA: Boolean;

    procedure InsertNewRecord();
    var
        courseRec: Record Course;
    begin
        with courseRec do begin
            Init;
            Code := '80040';
            Name := 'Installation & Configuration';
            Description := 'Basic knowledge of Installation & Configuration';
            Type := Type::"Remote Training";
            Duration := 2.0;
            Price := 1000.0;
            Active := true;
            Difficulty := 5;
            PassingRate := 75;
            Insert;
            Message('Insert 80040');
        end;
        with courseRec do begin
            Init;
            Code := '80041';
            Name := 'Finance';
            Description := 'Basic knowledge of finance';
            Type := Type::"Instructor Led";
            Duration := 3.0;
            Price := 1500.0;
            Active := true;
            Difficulty := 7;
            PassingRate := 80;
            Insert;
            Message('Insert 80041');
        end;
        with courseRec do begin
            Init;
            Code := '80042';
            Name := 'C/SIDE Introduction';
            Description := 'Introduction to programming';
            Type := Type::"Instructor Led";
            Duration := 5.0;
            Price := 2500.0;
            Active := true;
            Difficulty := 8;
            PassingRate := 80;
            Insert;
            Message('Insert 80042');
        end;
        with courseRec do begin
            Init;
            Code := '80043';
            Name := 'Introduction';
            Description := 'Introduction to Microsoft Dynamics NAV';
            Type := Type::"Remote Training";
            Duration := 2.0;
            Price := 1000.0;
            Active := true;
            Difficulty := 4;
            PassingRate := 60;
            Insert;
            Message('Insert 80043');
        end;
        with courseRec do begin
            Init;
            Code := '80049';
            Name := 'Application Setup';
            Description := 'Basic knowledge of application setup';
            Type := Type::"e-Learning";
            Duration := 2.0;
            Price := 1000.0;
            Active := true;
            Difficulty := 5;
            PassingRate := 65;
            Insert;
            Message('Insert 80049');
        end;
        with courseRec do begin
            Init;
            Code := '80050';
            Name := 'Business Intelligence';
            Description := 'Basic knowledge of Business Intelligence';
            Type := Type::"e-Learning";
            Duration := 1.0;
            Price := 500.0;
            Active := true;
            Difficulty := 5;
            PassingRate := 65;
            Insert;
            Message('Insert 80050');
        end;
        with courseRec do begin
            Init;
            Code := '80055';
            Name := 'C/SIDE Solution Development';
            Description := 'Advanced topics in programming';
            Type := Type::"Instructor Led";
            Duration := 5.0;
            Price := 2500.0;
            Active := true;
            Difficulty := 10;
            PassingRate := 75;
            Insert;
            Message('Insert 80055');
        end;
    end;

    trigger OnAfterGetRecord();
    begin
        Level := '';
        Suggestion := '';
        SPA := false;
        case Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginner';
                    Suggestion := 'Take e-eLarning or remote training';
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend instructor-Led';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend instructor-Led and self sdudy';
                end;
        end;
        if (passingRate >= 70) AND (Difficulty >= 6) then
            SPA := true;
    end;
}