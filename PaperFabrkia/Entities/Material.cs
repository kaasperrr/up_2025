using System;
using System.Collections.Generic;

namespace PaperFabrkia.Entities;

public partial class Material
{
    public int IdMaterial { get; set; }

    public string? NameMaterial { get; set; }

    public string? Image { get; set; }

    public decimal? Ostatok { get; set; }

    public decimal? Cena { get; set; }

    public int? IdType { get; set; }

    public string? Opisanie { get; set; }

    public string? EdIsmer { get; set; }

    public decimal? KolNaSklade { get; set; }

    public decimal? KolVUpakovke { get; set; }

    public virtual Type? IdTypeNavigation { get; set; }

    public virtual ICollection<MaterialProdukcium> MaterialProdukcia { get; set; } = new List<MaterialProdukcium>();

    public virtual ICollection<Sklad> Sklads { get; set; } = new List<Sklad>();
}
