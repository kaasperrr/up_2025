using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace PaperFabrkia.Entities;

public partial class Pm04Isp33BsvContext : DbContext
{
    public Pm04Isp33BsvContext()
    {
    }

    public Pm04Isp33BsvContext(DbContextOptions<Pm04Isp33BsvContext> options)
        : base(options)
    {
    }

    public virtual DbSet<HistoryUpdateCount> HistoryUpdateCounts { get; set; }

    public virtual DbSet<Material> Materials { get; set; }

    public virtual DbSet<MaterialProdukcium> MaterialProdukcia { get; set; }

    public virtual DbSet<Postavshik> Postavshiks { get; set; }

    public virtual DbSet<Produkcium> Produkcia { get; set; }

    public virtual DbSet<Proizvodstvo> Proizvodstvos { get; set; }

    public virtual DbSet<Sklad> Sklads { get; set; }

    public virtual DbSet<Sotrudnik> Sotrudniks { get; set; }

    public virtual DbSet<Type> Types { get; set; }

    public virtual DbSet<TypeProdukcii> TypeProdukciis { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS; Database=PM04_ISP33_BSV; Trusted_Connection=True;encrypt=false;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<HistoryUpdateCount>(entity =>
        {
            entity.HasKey(e => e.IdHistoryupdate);

            entity.ToTable("History_UpdateCount");

            entity.Property(e => e.IdHistoryupdate).HasColumnName("id_historyupdate");
            entity.Property(e => e.CountNew)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("count_new");
            entity.Property(e => e.CountOld)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("count_old");
            entity.Property(e => e.NameMaterial)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name_material");
        });

        modelBuilder.Entity<Material>(entity =>
        {
            entity.HasKey(e => e.IdMaterial);

            entity.ToTable("Material");

            entity.Property(e => e.IdMaterial).HasColumnName("id_material");
            entity.Property(e => e.Cena)
                .HasColumnType("money")
                .HasColumnName("cena");
            entity.Property(e => e.EdIsmer)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ed_ismer");
            entity.Property(e => e.IdType).HasColumnName("id_type");
            entity.Property(e => e.Image)
                .HasDefaultValueSql("(N'\\image\\picture.jpg')")
                .HasColumnType("text")
                .HasColumnName("image");
            entity.Property(e => e.KolNaSklade)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("kol_na_sklade");
            entity.Property(e => e.KolVUpakovke)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("kol_v_upakovke");
            entity.Property(e => e.NameMaterial)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name_material");
            entity.Property(e => e.Opisanie)
                .IsUnicode(false)
                .HasColumnName("opisanie");
            entity.Property(e => e.Ostatok)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("ostatok");

            entity.HasOne(d => d.IdTypeNavigation).WithMany(p => p.Materials)
                .HasForeignKey(d => d.IdType)
                .HasConstraintName("FK_Material_Type");
        });

        modelBuilder.Entity<MaterialProdukcium>(entity =>
        {
            entity.HasKey(e => new { e.IdMaterial, e.IdProdukcia }).HasName("PK_Material_Produkcia_1");

            entity.ToTable("Material_Produkcia");

            entity.Property(e => e.IdMaterial).HasColumnName("id_material");
            entity.Property(e => e.IdProdukcia).HasColumnName("id_produkcia");
            entity.Property(e => e.MinKolMaterial)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("min_kol_material");

            entity.HasOne(d => d.IdMaterialNavigation).WithMany(p => p.MaterialProdukcia)
                .HasForeignKey(d => d.IdMaterial)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Material_Produkcia_Material");

            entity.HasOne(d => d.IdProdukciaNavigation).WithMany(p => p.MaterialProdukcia)
                .HasForeignKey(d => d.IdProdukcia)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Material_Produkcia_Produkcia");
        });

        modelBuilder.Entity<Postavshik>(entity =>
        {
            entity.HasKey(e => e.IdPostavshik);

            entity.ToTable("Postavshik");

            entity.Property(e => e.IdPostavshik).HasColumnName("id_postavshik");
            entity.Property(e => e.EmailPostavshik)
                .HasMaxLength(80)
                .IsUnicode(false)
                .HasColumnName("email_postavshik");
            entity.Property(e => e.LogoPostavshik)
                .HasColumnType("text")
                .HasColumnName("logo_postavshik");
            entity.Property(e => e.NamePostavshik)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name_postavshik");
            entity.Property(e => e.PhonePostavshik)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("phone_postavshik");
        });

        modelBuilder.Entity<Produkcium>(entity =>
        {
            entity.HasKey(e => e.IdProdukcia);

            entity.Property(e => e.IdProdukcia)
                .ValueGeneratedNever()
                .HasColumnName("id_produkcia");
            entity.Property(e => e.IdProizvodstvo).HasColumnName("id_proizvodstvo");
            entity.Property(e => e.IdTypeProdukcii).HasColumnName("id_type_produkcii");
            entity.Property(e => e.NameProdukcia)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasColumnName("name_produkcia");

            entity.HasOne(d => d.IdProizvodstvoNavigation).WithMany(p => p.Produkcia)
                .HasForeignKey(d => d.IdProizvodstvo)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Produkcia_Proizvodstvo");

            entity.HasOne(d => d.IdTypeProdukciiNavigation).WithMany(p => p.Produkcia)
                .HasForeignKey(d => d.IdTypeProdukcii)
                .HasConstraintName("FK_Produkcia_Type_Produkcii");
        });

        modelBuilder.Entity<Proizvodstvo>(entity =>
        {
            entity.HasKey(e => e.IdProizvodstvo);

            entity.ToTable("Proizvodstvo");

            entity.Property(e => e.IdProizvodstvo).HasColumnName("id_proizvodstvo");
            entity.Property(e => e.NameProizvodstvo)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name_proizvodstvo");
        });

        modelBuilder.Entity<Sklad>(entity =>
        {
            entity.HasKey(e => new { e.IdMaterial, e.IdPostavshik });

            entity.ToTable("Sklad");

            entity.Property(e => e.IdMaterial).HasColumnName("id_material");
            entity.Property(e => e.IdPostavshik).HasColumnName("id_postavshik");
            entity.Property(e => e.StoimostEd)
                .HasColumnType("money")
                .HasColumnName("stoimost_ed");

            entity.HasOne(d => d.IdMaterialNavigation).WithMany(p => p.Sklads)
                .HasForeignKey(d => d.IdMaterial)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Sklad_Material");

            entity.HasOne(d => d.IdPostavshikNavigation).WithMany(p => p.Sklads)
                .HasForeignKey(d => d.IdPostavshik)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Sklad_Postavshik");
        });

        modelBuilder.Entity<Sotrudnik>(entity =>
        {
            entity.HasKey(e => e.IdSotrudnik);

            entity.ToTable("Sotrudnik");

            entity.Property(e => e.IdSotrudnik).HasColumnName("id_sotrudnik");
            entity.Property(e => e.Fio)
                .IsUnicode(false)
                .HasColumnName("FIO");
            entity.Property(e => e.IdProizvodstvo).HasColumnName("id_proizvodstvo");

            entity.HasOne(d => d.IdProizvodstvoNavigation).WithMany(p => p.Sotrudniks)
                .HasForeignKey(d => d.IdProizvodstvo)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Sotrudnik_Proizvodstvo");
        });

        modelBuilder.Entity<Type>(entity =>
        {
            entity.HasKey(e => e.IdType);

            entity.ToTable("Type");

            entity.Property(e => e.IdType).HasColumnName("id_type");
            entity.Property(e => e.NameType)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name_type");
        });

        modelBuilder.Entity<TypeProdukcii>(entity =>
        {
            entity.HasKey(e => e.IdTypeProdukcii);

            entity.ToTable("Type_Produkcii");

            entity.Property(e => e.IdTypeProdukcii).HasColumnName("id_type_produkcii");
            entity.Property(e => e.TypeProdukcii1)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("type_produkcii");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
