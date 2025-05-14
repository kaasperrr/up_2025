using System;
using System.Collections.Generic;

namespace PaperFabrkia.Entities;

public partial class Sotrudnik
{
    public int IdSotrudnik { get; set; }

    public string? Fio { get; set; }

    public int IdProizvodstvo { get; set; }

    public virtual Proizvodstvo IdProizvodstvoNavigation { get; set; } = null!;
}
