using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Library.Migrations
{
    public partial class query : Migration
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
                    EditorialId = table.Column<int>(nullable: true),
                    Fecha = table.Column<DateTime>(nullable: false),
                    Costo = table.Column<int>(nullable: false),
                    PrecioSugerido = table.Column<int>(nullable: false),
                    Autor = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Libro", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Libro_Editorial_EditorialId",
                        column: x => x.EditorialId,
                        principalTable: "Editorial",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
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
                columns: new[] { "Id", "Autor", "Costo", "EditorialId", "Fecha", "IdEditorial", "PrecioSugerido", "Titulo" },
                values: new object[] { 1, "Gabo", 200000, null, new DateTime(2021, 2, 7, 15, 21, 20, 133, DateTimeKind.Local).AddTicks(8906), 1, 5000000, "viento se llevo" });

            migrationBuilder.CreateIndex(
                name: "IX_Libro_EditorialId",
                table: "Libro",
                column: "EditorialId");
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
