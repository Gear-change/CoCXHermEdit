package classes.Stats {
import classes.Creature;
import classes.PerkLib;
import classes.Monster;

public class CoreStat extends RawStat{
	public function CoreStat(host:Creature, name:String) {
		super(host, name, {min:0, value:0, max: 100});
	}
	
	override public function get max():Number {
		if (host is Monster) return Infinity;
		var base:Number = 100;
		base += 2 * host.perkv1(PerkLib.AscensionTranshumanism);
		switch (statName) {
			case 'str.core':
				base += 16 * host.perkv1(PerkLib.AscensionTranshumanismStr);
				base += host.perkv1(PerkLib.BodyTempering);
				if (host.hasPerk(PerkLib.AsuraStrength)) base *= 1.1;
				base = Math.round(base);
				break;
			case 'tou.core':
				base += 16 * host.perkv1(PerkLib.AscensionTranshumanismTou);
				base += host.perkv1(PerkLib.BodyTempering);
				var tou:Number = 1;
				if (host.hasPerk(PerkLib.AsuraToughness)) tou += 0.1;
				if (host.hasPerk(PerkLib.BloodDemonToughness)) tou += 0.1;
				if (host.hasPerk(PerkLib.DemonSovereignToughnessAndLibido)) wis += 0.05;
				base *= tou;
				base = Math.round(base);
				break;
			case 'spe.core':
				base += 16 * host.perkv1(PerkLib.AscensionTranshumanismSpe);
				base += host.perkv1(PerkLib.BodyTempering);
				if (host.hasPerk(PerkLib.AsuraSpeed)) base *= 1.1;
				base = Math.round(base);
				break;
			case 'int.core':
				base += 16 * host.perkv1(PerkLib.AscensionTranshumanismInt);
				base += host.perkv1(PerkLib.SoulTempering);
				var inte:Number = 1;
				if (host.hasPerk(PerkLib.BloodDemonIntelligence)) inte += 0.1;
				if (host.hasPerk(PerkLib.GreySageIntelligence)) inte += 0.1;
				base *= inte;
				base = Math.round(base);
				break;
			case 'wis.core':
				base += 16 * host.perkv1(PerkLib.AscensionTranshumanismWis);
				base += host.perkv1(PerkLib.SoulTempering);
				var wis:Number = 1;
				if (host.hasPerk(PerkLib.BloodDemonWisdom)) wis += 0.1;
				if (host.hasPerk(PerkLib.GreySageWisdom)) wis += 0.1;
				base *= wis;
				base = Math.round(base);
				break;
			case 'lib.core':
				base += 16 * host.perkv1(PerkLib.AscensionTranshumanismLib);
				base += host.perkv1(PerkLib.SoulTempering);
				if (host.hasPerk(PerkLib.DemonSovereignToughnessAndLibido)) wis += 0.05;
				break;
		}
		return base;
	}
}
}
