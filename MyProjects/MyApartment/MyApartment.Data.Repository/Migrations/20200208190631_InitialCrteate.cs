using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MyApartment.Data.Repository.Migrations
{
    public partial class InitialCrteate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Benificiries",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    FirstName = table.Column<string>(maxLength: 100, nullable: false),
                    LastName = table.Column<string>(maxLength: 100, nullable: true),
                    Address = table.Column<string>(maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Benificiries", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Renumerators",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    FirstName = table.Column<string>(maxLength: 50, nullable: false),
                    LastName = table.Column<string>(maxLength: 50, nullable: false),
                    DateOfBirth = table.Column<DateTimeOffset>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Renumerators", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Expenses",
                columns: table => new
                {
                    ExpenseId = table.Column<Guid>(nullable: false),
                    ExpenseDescription = table.Column<string>(maxLength: 1000, nullable: false),
                    ExpenseAmount = table.Column<double>(nullable: false),
                    ExpenseType = table.Column<int>(nullable: false),
                    TransactionDate = table.Column<DateTime>(nullable: false),
                    Payee = table.Column<string>(nullable: false),
                    Payer = table.Column<string>(nullable: true),
                    BeneficiaryId = table.Column<Guid>(nullable: false),
                    RemuneratorId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Expenses", x => x.ExpenseId);
                    table.ForeignKey(
                        name: "FK_Expenses_Benificiries_BeneficiaryId",
                        column: x => x.BeneficiaryId,
                        principalTable: "Benificiries",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Expenses_Renumerators_RemuneratorId",
                        column: x => x.RemuneratorId,
                        principalTable: "Renumerators",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Expenses_BeneficiaryId",
                table: "Expenses",
                column: "BeneficiaryId");

            migrationBuilder.CreateIndex(
                name: "IX_Expenses_RemuneratorId",
                table: "Expenses",
                column: "RemuneratorId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Expenses");

            migrationBuilder.DropTable(
                name: "Benificiries");

            migrationBuilder.DropTable(
                name: "Renumerators");
        }
    }
}
