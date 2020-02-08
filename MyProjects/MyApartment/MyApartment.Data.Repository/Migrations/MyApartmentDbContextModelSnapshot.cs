﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using MyApartment.Data.Services;

namespace MyApartment.Data.Repository.Migrations
{
    [DbContext(typeof(MyApartmentDbContext))]
    partial class MyApartmentDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.1")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("MyApartment.Core.Model.MyApartmentBeneficiary", b =>
                {
                    b.Property<Guid>("BeneficiaryId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(100)")
                        .HasMaxLength(100);

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasColumnType("nvarchar(100)")
                        .HasMaxLength(100);

                    b.Property<string>("LastName")
                        .HasColumnType("nvarchar(100)")
                        .HasMaxLength(100);

                    b.HasKey("BeneficiaryId");

                    b.ToTable("Benificiries");
                });

            modelBuilder.Entity("MyApartment.Core.Model.MyApartmentExpense", b =>
                {
                    b.Property<Guid>("ExpenseId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("BeneficiaryId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<double>("ExpenseAmount")
                        .HasColumnType("float");

                    b.Property<string>("ExpenseDescription")
                        .IsRequired()
                        .HasColumnType("nvarchar(1000)")
                        .HasMaxLength(1000);

                    b.Property<int>("ExpenseType")
                        .HasColumnType("int");

                    b.Property<string>("Payee")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Payer")
                        .HasColumnType("nvarchar(max)");

                    b.Property<Guid>("RemuneratorId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("TransactionDate")
                        .HasColumnType("datetime2");

                    b.HasKey("ExpenseId");

                    b.HasIndex("BeneficiaryId");

                    b.HasIndex("RemuneratorId");

                    b.ToTable("Expenses");
                });

            modelBuilder.Entity("MyApartment.Core.Model.MyApartmentRemunerator", b =>
                {
                    b.Property<Guid>("RemuneratorId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTimeOffset>("DateOfBirth")
                        .HasColumnType("datetimeoffset");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)")
                        .HasMaxLength(50);

                    b.HasKey("RemuneratorId");

                    b.ToTable("Renumerators");
                });

            modelBuilder.Entity("MyApartment.Core.Model.MyApartmentExpense", b =>
                {
                    b.HasOne("MyApartment.Core.Model.MyApartmentBeneficiary", "Beneficiary")
                        .WithMany("Expenses")
                        .HasForeignKey("BeneficiaryId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("MyApartment.Core.Model.MyApartmentRemunerator", "Remunerator")
                        .WithMany("Expenses")
                        .HasForeignKey("RemuneratorId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
