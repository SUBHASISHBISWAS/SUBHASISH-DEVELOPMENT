using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace MyApartment.Data.Repository.Migrations
{
    public partial class KeyUpdate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Expenses_Benificiries_BeneficiaryId",
                table: "Expenses");

            migrationBuilder.DropForeignKey(
                name: "FK_Expenses_Renumerators_RemuneratorId",
                table: "Expenses");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Renumerators",
                table: "Renumerators");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Benificiries",
                table: "Benificiries");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "Renumerators");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "Benificiries");

            migrationBuilder.AddColumn<Guid>(
                name: "RemuneratorId",
                table: "Renumerators",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddColumn<Guid>(
                name: "BeneficiaryId",
                table: "Benificiries",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddPrimaryKey(
                name: "PK_Renumerators",
                table: "Renumerators",
                column: "RemuneratorId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Benificiries",
                table: "Benificiries",
                column: "BeneficiaryId");

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

            migrationBuilder.DropPrimaryKey(
                name: "PK_Renumerators",
                table: "Renumerators");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Benificiries",
                table: "Benificiries");

            migrationBuilder.DropColumn(
                name: "RemuneratorId",
                table: "Renumerators");

            migrationBuilder.DropColumn(
                name: "BeneficiaryId",
                table: "Benificiries");

            migrationBuilder.AddColumn<Guid>(
                name: "Id",
                table: "Renumerators",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddColumn<Guid>(
                name: "Id",
                table: "Benificiries",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddPrimaryKey(
                name: "PK_Renumerators",
                table: "Renumerators",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Benificiries",
                table: "Benificiries",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Expenses_Benificiries_BeneficiaryId",
                table: "Expenses",
                column: "BeneficiaryId",
                principalTable: "Benificiries",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Expenses_Renumerators_RemuneratorId",
                table: "Expenses",
                column: "RemuneratorId",
                principalTable: "Renumerators",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
