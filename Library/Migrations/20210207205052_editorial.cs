using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Library.Migrations
{
    public partial class editorial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Editorial",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Editorial", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Libro",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Titulo = table.Column<string>(maxLength: 100, nullable: true),
                    IdEditorial = table.Column<int>(nullable: false),
                    Fecha = table.Column<DateTime>(nullable: false),
                    Costo = table.Column<int>(nullable: false),
                    PrecioSugerido = table.Column<int>(nullable: false),
                    Autor = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Libro", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Libro_Editorial_IdEditorial",
                        column: x => x.IdEditorial,
                        principalTable: "Editorial",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Editorial",
                columns: new[] { "Id", "Nombre" },
                values: new object[] { 1, "Colombina" });

            migrationBuilder.InsertData(
                table: "Editorial",
                columns: new[] { "Id", "Nombre" },
                values: new object[] { 2, "Circulo" });

            migrationBuilder.InsertData(
                table: "Libro",
                columns: new[] { "Id", "Autor", "Costo", "Fecha", "IdEditorial", "PrecioSugerido", "Titulo" },
                values: new object[] { 1, "Gabo", 200000, new DateTime(2021, 2, 7, 15, 50, 50, 750, DateTimeKind.Local).AddTicks(859), 1, 5000000, "viento se llevo" });

            migrationBuilder.CreateIndex(
                name: "IX_Libro_IdEditorial",
                table: "Libro",
                column: "IdEditorial");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Libro");

            migrationBuilder.DropTable(
                name: "Editorial");
        }
    }
}
