using System;
using System.Collections.Generic;

namespace PaperFabrkia.Entities;

public partial class Produkcium
{
    public int IdProdukcia { get; set; }

    public string? NameProdukcia { get; set; }

    public int IdProizvodstvo { get; set; }

    public int? IdTypeProdukcii { get; set; }

    public virtual Proizvodstvo IdProizvodstvoNavigation { get; set; } = null!;

    public virtual TypeProdukcii? IdTypeProdukciiNavigation { get; set; }

    public virtual ICollection<MaterialProdukcium> MaterialProdukcia { get; set; } = new List<MaterialProdukcium>();
}
