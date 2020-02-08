using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MyApartment.Data.Repository.Migrations
{
    public partial class NewModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Payees");

            migrationBuilder.AddColumn<Guid>(
                name: "BeneficiaryId",
                table: "Expenses",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddColumn<Guid>(
                name: "RemuneratorId",
                table: "Expenses",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.CreateTable(
                name: "Benificiries",
                columns: table => new
                {
                    BeneficiaryId = table.Column<Guid>(nullable: false),
                    FirstName = table.Column<string>(maxLength: 100, nullable: false),
                    LastName = table.Column<string>(maxLength: 100, nullable: true),
                    Address = table.Column<string>(maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Benificiries", x => x.BeneficiaryId);
                });

            migrationBuilder.CreateTable(
                name: "Renumerators",
                columns: table => new
                {
                    RemuneratorId = table.Column<Guid>(nullable: false),
                    FirstName = table.Column<string>(maxLength: 50, nullable: false),
                    LastName = table.Column<string>(maxLength: 50, nullable: false),
                    DateOfBirth = table.Column<DateTimeOffset>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Renumerators", x => x.RemuneratorId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Expenses_BeneficiaryId",
                table: "Expenses",
                column: "BeneficiaryId");

            migrationBuilder.CreateIndex(
                name: "IX_Expenses_RemuneratorId",
                table: "Expenses",
                column: "RemuneratorId");

            migrationBuilder.AddForeignKey(
                name: "FK_Expenses_Benificiries_BeneficiaryId",
                table: "Expenses",
                column: "BeneficiaryId",
                principalTable: "Benificiries",
                principalColumn: "BeneficiaryId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Expenses_Renumerators_RemuneratorId",
                table: "Expenses",
                column: "RemuneratorId",
                principalTable: "Renumerators",
                principalColumn: "RemuneratorId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Expenses_Benificiries_BeneficiaryId",
                table: "Expenses");

            migrationBuilder.DropForeignKey(
                name: "FK_Expenses_Renumerators_RemuneratorId",
                table: "Expenses");

            migrationBuilder.DropTable(
                name: "Benificiries");

            migrationBuilder.DropTable(
                name: "Renumerators");

            migrationBuilder.DropIndex(
                name: "IX_Expenses_BeneficiaryId",
                table: "Expenses");

            migrationBuilder.DropIndex(
                name: "IX_Expenses_RemuneratorId",
                table: "Expenses");

            migrationBuilder.DropColumn(
                name: "BeneficiaryId",
                table: "Expenses");

            migrationBuilder.DropColumn(
                name: "RemuneratorId",
                table: "Expenses");

            migrationBuilder.CreateTable(
                name: "Payees",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(1500)", maxLength: 1500, nullable: true),
                    ExpenseId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Title = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Payees", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Payees_Expenses_ExpenseId",
                        column: x => x.ExpenseId,
                        principalTable: "Expenses",
                        principalColumn: "ExpenseId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Payees_ExpenseId",
                table: "Payees",
                column: "ExpenseId");
        }
    }
}
