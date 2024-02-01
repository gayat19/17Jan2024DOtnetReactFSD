using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FirstAPI.Migrations
{
    public partial class Request : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Employees_Departments_DepartmentId",
                table: "Employees");

            migrationBuilder.AlterColumn<int>(
                name: "DepartmentId",
                table: "Employees",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.CreateTable(
                name: "Requests",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RequestText = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    RequestType = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    RaisedDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastUpdatedDte = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ResolvedDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Issuer_Id = table.Column<int>(type: "int", nullable: false),
                    Resolver_Id = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Requests", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Requests_Employees_Issuer_Id",
                        column: x => x.Issuer_Id,
                        principalTable: "Employees",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Requests_Employees_Resolver_Id",
                        column: x => x.Resolver_Id,
                        principalTable: "Employees",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Requests_Issuer_Id",
                table: "Requests",
                column: "Issuer_Id");

            migrationBuilder.CreateIndex(
                name: "IX_Requests_Resolver_Id",
                table: "Requests",
                column: "Resolver_Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Employees_Departments_DepartmentId",
                table: "Employees",
                column: "DepartmentId",
                principalTable: "Departments",
                principalColumn: "DeparmentNumber");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Employees_Departments_DepartmentId",
                table: "Employees");

            migrationBuilder.DropTable(
                name: "Requests");

            migrationBuilder.AlterColumn<int>(
                name: "DepartmentId",
                table: "Employees",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Employees_Departments_DepartmentId",
                table: "Employees",
                column: "DepartmentId",
                principalTable: "Departments",
                principalColumn: "DeparmentNumber",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
