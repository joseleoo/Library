using Library.Models;
using Microsoft.EntityFrameworkCore;
//using LibraryOlimpicos.Models;
using System;
using System.Collections.Generic;
using System.Linq;


namespace Library.Context
{
    public class LibraryDbContext : DbContext
    {
        public LibraryDbContext()
        {
        }

        public LibraryDbContext(DbContextOptions<LibraryDbContext> options)
        : base(options)
        {

        }

        public DbSet<Editorial> Editorial { get; set; }
        public DbSet<Libro> Libro { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);




            var editoriales = new List<Editorial> {
            new Editorial { Id=1,Nombre="Colombina"},
            new Editorial { Id=2,Nombre="Circulo"}
            };

            var libros = new List<Libro> {
            new Libro { Id=1,Titulo="viento se llevo",Autor="Gabo",Costo=200000,Fecha=DateTime.Now,IdEditorial=1,PrecioSugerido=5000000} 
            };




            modelBuilder.Entity<Editorial>().HasData(editoriales.ToArray());
            modelBuilder.Entity<Libro>().HasData(libros.ToArray());

        }



    }
}
